Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCBB280E8B
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgJBIK4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:10:56 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2334 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIKz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:10:55 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76e0820000>; Fri, 02 Oct 2020 01:10:42 -0700
Received: from [10.2.56.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:10:54 +0000
Subject: Re: [PATCH] selftests/vm: fix: make check_config.sh executable
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20201002064811.435769-1-jhubbard@nvidia.com>
 <20201002175931.5317ef64@canb.auug.org.au>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <2bd44214-ff9c-0333-9525-3db29b9a3ff1@nvidia.com>
Date:   Fri, 2 Oct 2020 01:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002175931.5317ef64@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601626242; bh=eyN9+dSvU4EioHJCoFawVpxthFRdcJJa/b/qIwePnfs=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=SbezKasJWbn96ME4AEbGdR8GJ1aFpQDhl4DpeaM+HOIT9K1H+l9FTL6UYg9HG9c2h
         8NGY1FQg2vFhAnfUL74Jx2nBsc0keDmzggQXl35nRwXY8lI+5hSP8x059sSb1cNiIA
         Q/V248FjJPzrvpxDT1ajybLh5dd9OTcpVvxkqWKc68+OMIEUuOpEWPoO1cRwDztzf+
         IZTkt61DCAF/t6i1PACjXLK8BHL3yBxKO6gwFVuWadM/SzDAhMFpMAsY3Lp43SZvtt
         lIRXZzslb5PBWzZPfv7EgK/TliWEafYggRjECOpYLernXW1Ue+5EX31XvTRjKRDFnZ
         KZM81Ualw9IMg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/2/20 12:59 AM, Stephen Rothwell wrote:
> Hi John,
> 
> On Thu, 1 Oct 2020 23:48:11 -0700 John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
>> dependency") created the new check_config.sh file without the execute
>> bits set. This is a problem because the Makefile runs it with "./", so
>> now "make" is failing in that directory.
>>
>> The posted patch [1] does seem to have it as an executable file, so I'm
>> not sure how this happened. But in any case, make check_config.sh
>> executable again, so that "make" in selftests/vm works once again.
> 
> The correct fix is to make sure that the Makefile runs it explicitly
> with a shell because is such a patch is applied with patch(1), the
> execute bit will not be preserved.
> 
> See e.g. in the top level Makefile:
> 
> 	$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
> 

OK...we should also fix it anyway, seeing as how the run_vmtest.sh also needs
the execute bit re-set, yes?

So I guess I should send a patch that does:

* chmod +x on both run_vmtest.sh and check_config.sh, plus

* invoke check_config.sh via $(CONFIG_SHELL) from the Makefile.

Does that sound about right?

thanks,
-- 
John Hubbard
NVIDIA
