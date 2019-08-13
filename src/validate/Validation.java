package validate;

public class Validation 
{
	public boolean nameValidator(String data)
    {		
		if(data.length()<1)
			return false;
		for(int i=0;i<data.length();i++)
		{
			if(data.charAt(i)==32)
				continue;
			if(data.charAt(i)<65 || data.charAt(i)>122 || (data.charAt(i)>90 && data.charAt(i)<97))
			{	
				System.out.println(i+" "+data.charAt(i));
				return false;
			}	
		}
		return true;
    }
	public boolean useridValidator(String data)
    {
		int i,j;
        int len = data.length();
        if(len==0)
            return false;
        for(i=1 ; i!=len-1; i++)
        {
            if(data.charAt(i)==64)
            {
                break;
            }
        }
        if(data.charAt(i)==data.charAt(len-1))
            return false;
        String sub = data.substring(0, i);
        boolean status = usernameValidator(sub);
        if(status==false)
        {
            return false;
        }
        int cnt=0;
        for(j=i+1 ; j<len-4 ; j++)
        {
            if(!(data.charAt(j)>=48 && data.charAt(j)<=57) && !(data.charAt(j)>=65 && data.charAt(j)<=90) && !(data.charAt(j)>=97 && data.charAt(j)<=122))
            {
                return false;
            }
            if(cnt==10)
            {
                return false;
            }
            cnt++;
        }
        if(cnt<5)
        {
            return false;
        }
        String x = ".com";
        sub = data.substring(len-4, len);
        if(x.equals(sub)==false)
        {
            return false;
        }
        return true;
    }
	public boolean usernameValidator(String data)
    {
        if(data.length()<5)
        {
            return false;
        }
        if(data.charAt(0)<65 || (data.charAt(0)>90 && data.charAt(0)<97) || data.charAt(0)>122)
        {
            return false;
        }
        for(int i=1 ; i<data.length() ; i++)
        {
            if(data.charAt(i)!=45 && data.charAt(i)!=46 && !(data.charAt(i)>=48 && data.charAt(i)<=57) && !(data.charAt(i)>=65 && data.charAt(i)<=90) && data.charAt(i)!=95 && !(data.charAt(i)>=97 && data.charAt(i)<=122))
                return false;
        }
        return true;
    }
	public boolean pswdValidator(String data)
    {
        if(!(data.length()>=5 && data.length()<=10))
        {
            return false;
        }
		
        for(int i = 0; i<data.length();i++)
        {
            int asciivalue = data.charAt(i);

            if(!(asciivalue>=65 && asciivalue<=90))
            {
                if(!(asciivalue>=97 && asciivalue<=122))
                {
                    if(!(asciivalue>=48 && asciivalue<=57))
                    {
                        if(!((asciivalue==45) || (asciivalue==46) || (asciivalue==47) || (asciivalue==64) || (asciivalue==95) || (asciivalue==43)))
                        {
                            return false;
                        }
                    }
                }
            }
        }
            return true;
    }

}
