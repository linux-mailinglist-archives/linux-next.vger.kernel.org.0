Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6946F174911
	for <lists+linux-next@lfdr.de>; Sat, 29 Feb 2020 21:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgB2UHD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 29 Feb 2020 15:07:03 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5035 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgB2UHC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 29 Feb 2020 15:07:02 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5ac4580000>; Sat, 29 Feb 2020 12:06:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 29 Feb 2020 12:07:02 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 29 Feb 2020 12:07:02 -0800
Received: from ngvpn01-175-70.dyn.scz.us.nvidia.com (10.124.1.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Sat, 29 Feb 2020 20:07:02 +0000
Subject: Re: [RFC v1 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>
CC:     Christian Borntraeger <borntraeger@de.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <david@redhat.com>, <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
 <20200228154322.329228-4-imbrenda@linux.ibm.com>
 <2e3bf1a2-b672-68e0-97b6-42f08133e077@de.ibm.com>
 <ff35804f-81ef-a245-01d9-1f9b525e3410@nvidia.com>
 <20200229114919.1abcacc4@p-imbrenda>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <cc2e1664-cff1-de1e-2087-475ec7c6aa56@nvidia.com>
Date:   Sat, 29 Feb 2020 12:07:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229114919.1abcacc4@p-imbrenda>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583006808; bh=Wmoswp92q0ncm0Ak5aD4Ct5WPC9Xr+W7Or+k/XZL7Is=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=IEDvST0Qu3TviUS7V12sJ4TOu7edmLi+/7WRbx9igEIGIOaNGTA3kjoWTIFKQmsyD
         gLt++MWZMnlo7FVlceSiyCTdzqR51twboBlnGmtaOAilyPW8I3RA4sX2CwU6biC1c+
         p2QswktYWRuYLOdte9iX3FCaFfoEZASsJ5uCVBaCBes73UZT6CeGTexPBB8uZiDQz7
         cXba/nhb9u7YuXj5uerkShAuVS2wlOPUDPK2DYAWdDO+vf6Ht0EYKeU1m3vbskR2JI
         v+7IdMQ4lSHdbUyj1TrA2xm2/RlKXH/uj6RuEehCR8klC/bZsUabtZQyGEsWGHzk1A
         zesSNT3fxEn7A==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/29/20 2:49 AM, Claudio Imbrenda wrote:
>> ...
>>>> @@ -458,7 +457,6 @@ static struct page *follow_page_pte(struct
>>>> vm_area_struct *vma, }
>>>>   
>>>>   	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
>>>> -		int ret;
>>>>   		get_page(page);
>>>>   		pte_unmap_unlock(ptep, ptl);
>>>>   		lock_page(page);
>>>> @@ -475,6 +473,14 @@ static struct page *follow_page_pte(struct
>>>> vm_area_struct *vma, page = ERR_PTR(-ENOMEM);
>>>>   		goto out;
>>>>   	}
>>>> +	if (flags & FOLL_PIN) {
>>
>>
>> What about FOLL_GET? Unless your calling code has some sort of
>> BUG_ON(flags & FOLL_GET), I'm not sure it's a good idea to leave that
>> case unhandled.
> 
> if I understood the semantics of FOLL_PIN correctly, then we don't need
> to make the page accessible for FOLL_GET. FOLL_PIN indicates intent to
> access the content of the page, whereas FOLL_GET is only for the struct
> page.
> 
> if we are not touching the content of the page, there is no need to
> make it accessible
> 


OK, I hope I'm not overlooking anything, but that sounds correct to me.


thanks,
-- 
John Hubbard
NVIDIA
