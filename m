Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3951D280E1E
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 09:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgJBHfz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 03:35:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18348 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBHfz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 03:35:55 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76d84e0000>; Fri, 02 Oct 2020 00:35:42 -0700
Received: from [10.2.56.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 07:35:55 +0000
Subject: Re: [PATCH] selftests/vm: fix: make check_config.sh executable
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20201002064811.435769-1-jhubbard@nvidia.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <fa388abf-c6b6-f975-959c-6bc1be03f026@nvidia.com>
Date:   Fri, 2 Oct 2020 00:35:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002064811.435769-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601624142; bh=6aKRGI4jjZ60KF/SCMuVt1rtkIbOvp8a1aQsfb/vwtA=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=Qlqk4gqH248giwliwSnfsfUNuGu+EywSeQTKnzTI4rRgmfWbtkp0NCKF7NK4dIoPH
         ZYPqa6OvGQIB44NsZR1cr1HLBqGBZalf12ELH1sVvQJG4xhNS6PqKryf6Phvj8kzIb
         dx5tu+3+QVymJk2z7DSEPASgsyioKkA7aXD7JqeP9FD/4s8lXJ1bsxny4BOdN7U2ME
         JjliyDQvF7TmVxnZmtFAMeZALF6KSZbCVWjsswhYx89OsSfIrqaEQOAFE8v3SPasFE
         y1xFx0BWcEEs/4PrOMIYWXc045AQz3QDlQpdLXp2QXTs1ejvzUP17KEkHVI97EjN2m
         eqDgub5ik04RA==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/20 11:48 PM, John Hubbard wrote:
> commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
> dependency") created the new check_config.sh file without the execute
> bits set. This is a problem because the Makefile runs it with "./", so
> now "make" is failing in that directory.
> 
> The posted patch [1] does seem to have it as an executable file, so I'm
> not sure how this happened. But in any case, make check_config.sh
> executable again, so that "make" in selftests/vm works once again.
> 
> [1] https://lore.kernel.org/linux-doc/20200929212747.251804-9-jhubbard@nvidia.com/
> 
> Fixes: commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs dependency")
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> Hi,
> 
> This applies to today's 20201001) linux-next. I forgot if this needs to
> be a separate patch or if it can be fixed up in Andrew's tree.
> 

hmm, in fact I think something similar also happened to run_vmtest.sh, in the same
directory. Please let me know if a patch is needed there, or if you can just fix
up this one or the tree or something?

> thanks,
> John Hubbard
> NVIDIA
> 
> 
>   tools/testing/selftests/vm/check_config.sh | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   mode change 100644 => 100755 tools/testing/selftests/vm/check_config.sh
> 
> diff --git a/tools/testing/selftests/vm/check_config.sh b/tools/testing/selftests/vm/check_config.sh
> old mode 100644
> new mode 100755
> 

thanks,
-- 
John Hubbard
NVIDIA
