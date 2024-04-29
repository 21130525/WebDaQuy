package dao.adminDAO;

public abstract class AbsLogAdminDAO<T> implements IDAOLogAdmin<T>  {
    @Override
    public String getBeforeData() {
        return null;
    }

    @Override
    public String getAfterData() {
        return null;
    }
}
