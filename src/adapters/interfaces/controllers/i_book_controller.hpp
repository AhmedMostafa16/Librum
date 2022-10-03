#pragma once
#include <QObject>
#include <QString>
#include <QList>
#include <QVariantMap>
#include <QPixmap>
#include "book_dto.hpp"
#include "library_model.hpp"


namespace adapters
{

class IBookController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(adapters::data_models::LibraryModel* libraryModel READ getLibraryModel CONSTANT)
    Q_PROPERTY(int bookCount READ getBookCount NOTIFY bookCountChanged)
    
public:
    virtual ~IBookController() noexcept = default;
    
    
    Q_INVOKABLE virtual int addBook(const QString& path) = 0;
    Q_INVOKABLE virtual int deleteBook(const QString& title) = 0;
    Q_INVOKABLE virtual int updateBook(const QString& title,
                                       const QVariantMap& operations) = 0;
    Q_INVOKABLE virtual int addTag(const QString& title,
                                   const dtos::TagDto& tag) = 0;
    Q_INVOKABLE virtual int removeTag(const QString& title,
                                      const QString& tagName) = 0;
    Q_INVOKABLE virtual adapters::dtos::BookDto getBook(const QString& title) = 0;
    Q_INVOKABLE virtual int getBookCount() const = 0;
    
    virtual data_models::LibraryModel* getLibraryModel() = 0;
    
signals:
    void bookCountChanged();
};

} // namespace adapters