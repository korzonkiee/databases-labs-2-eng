-- Task 3

Create Procedure spSetCoursesExpirationDateAndStudentsGroupForSpecifiedField @FieldOfStufy varchar(100)
As
Begin
	Begin Try
		Set Transaction Isolation Level Read Committed
		Begin Transaction
			Update Courses Set ExpirationDate = GetDate() Where Field = @FieldOfStufy
			Update Students Set [Group] = Null Where Field = @FieldOfStufy			
		Commit Transaction
		Print 'Transaction commited'
	End Try
	Begin Catch
		Rollback Transaction
		Print 'Transaction rolled back'
	End Catch
End

