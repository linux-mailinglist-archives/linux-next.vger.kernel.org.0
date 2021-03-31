Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DA734F8AA
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 08:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhCaGXH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 02:23:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25540 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233793AbhCaGW7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 Mar 2021 02:22:59 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12V64HqZ155610;
        Wed, 31 Mar 2021 02:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=to : cc : references :
 from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding : subject; s=pp1;
 bh=ds9KDQE0lURuBbFdLw1dQMkw99BbaLkohL6SI1Cl21g=;
 b=VJMW9NedmnMPKVag38WKKJ0k3sr5yW0G4vdeE86ZNa+kbQsJAUoBBJzFff4FREBRzkwH
 c8fQ2UhHt6EDMvHqZQaYFLNP2tgqXvJV6H/F+h4IMykeNvSAEU5zKS+JN5JygBK4aipb
 9OaEB2uJ1OAIj6X1pAnarmg5el13SXUGUNrAw5p84Q6lEqiPgUk+KE+W+jTGVP9jwDjv
 JHYLRCDaRWV4SyGDk1j6T8OFElGSt1EFH4DMfqktmhrmkUu8KrkyQRTXXVxmXWsAgRLE
 JWunD0I3JSrb55TPnIcIoW3Yk1LdZrMh62jv66ZIjXMBDGuSf0T3M9ajlkzF296dXuWP 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37mb3h386m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 02:22:47 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12V64llQ160083;
        Wed, 31 Mar 2021 02:22:46 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37mb3h3860-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 02:22:46 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12V6MfmC015951;
        Wed, 31 Mar 2021 06:22:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma04fra.de.ibm.com with ESMTP id 37maaxr5vx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 06:22:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12V6MgOu27263308
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 06:22:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A52984C052;
        Wed, 31 Mar 2021 06:22:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C5B3F4C050;
        Wed, 31 Mar 2021 06:22:41 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.8.136])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 31 Mar 2021 06:22:41 +0000 (GMT)
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Xiongchun Duan <duanxiongchun@bytedance.com>
References: <20210329205249.6b557510@canb.auug.org.au>
 <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
 <4419611b-3282-2197-884c-332025cdada8@de.ibm.com>
 <CAMZfGtUaTdmpcw1dr_rWQZTz3UTh9ZFavr0WBSa_obENPasgFw@mail.gmail.com>
 <7c27fc2e-5cea-5a17-6e30-8ae1cb291274@de.ibm.com>
 <CAMZfGtV9w24cJAwYsQuhvVpdLiYssjdfwfXApNK51zacr31c3w@mail.gmail.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <179f84ad-7b98-4bc5-f895-c19faabbb311@de.ibm.com>
Date:   Wed, 31 Mar 2021 08:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMZfGtV9w24cJAwYsQuhvVpdLiYssjdfwfXApNK51zacr31c3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7pEnv20s5T29mufr_NapfYxYJrxN59G3
X-Proofpoint-GUID: 8EQFTOGSlE-CQ_rgiN5HG6yhJL7u3mzX
Subject: RE: kernel warning percpu ref in obj_cgroup_release
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_01:2021-03-30,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310045
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 30.03.21 18:25, Muchun Song wrote:
> On Tue, Mar 30, 2021 at 11:10 PM Christian Borntraeger
> <borntraeger@de.ibm.com> wrote:
>>
>>
>> On 30.03.21 15:49, Muchun Song wrote:
>>> On Tue, Mar 30, 2021 at 9:27 PM Christian Borntraeger
>>> <borntraeger@de.ibm.com> wrote:
>>>>
>>>> So bisect shows this for belows warning:
>>>
>>> Thanks for your effort on this. Can you share your config?
>>
>> attached (but its s390x) for next-20210330
> 
> Thanks. Can you apply the following patch and help me test?
> Very Thanks.
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 7fdc92e1983e..579408e4d46f 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -793,6 +793,12 @@ static inline void obj_cgroup_get(struct obj_cgroup *objcg)
>          percpu_ref_get(&objcg->refcnt);
>   }
> 
> +static inline void obj_cgroup_get_many(struct obj_cgroup *objcg,
> +                                      unsigned long nr)
> +{
> +       percpu_ref_get_many(&objcg->refcnt, nr);
> +}
> +
>   static inline void obj_cgroup_put(struct obj_cgroup *objcg)
>   {
>          percpu_ref_put(&objcg->refcnt);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index c0b83a396299..1634dba1044c 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -3133,7 +3133,10 @@ void split_page_memcg(struct page *head, unsigned int nr)
> 
>          for (i = 1; i < nr; i++)
>                  head[i].memcg_data = head->memcg_data;
> -       css_get_many(&memcg->css, nr - 1);
> +       if (PageMemcgKmem(head))
> +               obj_cgroup_get_many(__page_objcg(head), nr - 1);
> +       else
> +               css_get_many(&memcg->css, nr - 1);
>   }
> 
>   #ifdef CONFIG_MEMCG_SWAP
> 

This one seems to do the trick, I can no longer see the warning.
