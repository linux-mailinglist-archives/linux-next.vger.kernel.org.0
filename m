Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3220174914
	for <lists+linux-next@lfdr.de>; Sat, 29 Feb 2020 21:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgB2UJR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 29 Feb 2020 15:09:17 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1756 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgB2UJR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 29 Feb 2020 15:09:17 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5ac49b0000>; Sat, 29 Feb 2020 12:07:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 29 Feb 2020 12:09:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 29 Feb 2020 12:09:16 -0800
Received: from ngvpn01-175-70.dyn.scz.us.nvidia.com (10.124.1.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Sat, 29 Feb 2020 20:09:16 +0000
Subject: Re: [RFC v1 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>
CC:     <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Jan Kara <jack@suse.cz>,
        "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
 <20200228154322.329228-3-imbrenda@linux.ibm.com>
 <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
 <20200229115119.3562c73e@p-imbrenda>
From:   John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a48a6fee-babe-45fd-5ff5-881fbdabf79b@nvidia.com>
Date:   Sat, 29 Feb 2020 12:09:15 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229115119.3562c73e@p-imbrenda>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583006875; bh=WYN4LBwZnbCVylzszIAE5BmxzjTnkAdGTg75EzquRoE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JSI3aFQgZbVSOB3uJJewzN/4XIcaXLXuDKnWsTB9acmpJZ0pf3zdF3PHxzxVQIbDJ
         nw0ONXApu4MoL/0WQUqvEEkkfzZFCU/d8+HLXWqdaE5cAPiI3pVGJh9a0pgvllNgj6
         3nqRRr1oRtHQxOcAbzef1VqrFd1rQvOGC816uUKjvr7YzKPWiS6KyccU09K7ZjEiQb
         u4IQpFX2zoRSCl5oNCAdBWc06cElblIYN6rohCGnfbSJ9O3b6/1uYn7p8r0QBOuD07
         JbKn64MyhRp31i44QV60wHcWEFLMZ8xNUAIHjLHErHx6bQ3MypiliSvu/gk7E/p2n8
         a5hrdo7TKjZDQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/29/20 2:51 AM, Claudio Imbrenda wrote:

> my idea was that my patch should be used as fix-up, so the actual
> content of the commit message is not relevant
> 


aha, OK. Yes, a fixup would be nice.


thanks,
-- 
John Hubbard
NVIDIA
