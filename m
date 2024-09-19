Return-Path: <linux-next+bounces-3927-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2E97CF63
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 01:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A421F22713
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 23:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EAC14A09A;
	Thu, 19 Sep 2024 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioCMVkuH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298817C8B;
	Thu, 19 Sep 2024 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726789564; cv=none; b=FBfHcJuXb9CiDVTydU+d325uy9cuMVqSslBK/4VSVNUU2du8sU+kcz7+yxxYGA5ITHegslTrFIf/O2thRlkZD4HsTUz/ZdMKfA9lzxHaO8aJLQArT8OXZSgxYbqTwe2YRzzHcsf+qjG1e4S1zO5Nlixrh156VgMhmzbnBv7t2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726789564; c=relaxed/simple;
	bh=vqzZy1A0o5mc5on3eFpuxUagpwrWUON52Xd0/KhOSRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTRtvkQn86s3SHKXaFG3nVg/R8gBcWu9raXYk+Ed1p9XEJeHtLFpXxFKGY4JUho7vPWm3Plt4OytRvneiK5JnrpbFFOhQUmFk5bkbZpu9E9i6UuVVColj8yUti2z0cVCuSDnazZ8uTAg1lNmSdf05c3bvoWas8NzKOzvlLDp23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioCMVkuH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a83562f9be9so161382266b.0;
        Thu, 19 Sep 2024 16:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726789561; x=1727394361; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNw+KwgX5BU49QjrEyk+XQBLcn1osmOHz4x6fiYtEnU=;
        b=ioCMVkuHwNBaP3NNTXvTV8+HuJtle2tYihQ33XbvmUxiSeHCVC1F1Qq7EZZf2cnSf4
         ZMAE2vgZBjBL2ntCFISNuzTV6lwxpEI9Y2fBCcOaDqKyM+zCF/kv+3V4Wdj6ej4sR2AI
         gQJWwHZ8A14JTCLOOUVTzoYPXlMLln9MzQWg03sor3n8Rkpa5qwS1xqfrK4PWGEUZayL
         tE9UKXmJObyXpgrryRl+YupCWZA/SQs4Tv01w2xoMSGt9KeZoKE6dRQFVmtiOpWJIIJF
         Zv/Nd84H3+p2WNFVHbtg4NW2n8Vdh3NNMUn1W9YaKV68iB5Ba3LLbMRvF1MHkFuMsfwI
         qsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726789561; x=1727394361;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oNw+KwgX5BU49QjrEyk+XQBLcn1osmOHz4x6fiYtEnU=;
        b=BOKOLeB35SzNyLRHciXOLyuI6Oj/fdZNbsoyTWfHlePpgA5UAO0neY1JCMnf+KoKlN
         reYoWQzf1OGEtZ3E+sqHJNLYg107KI2srRXZHgyneYGd0cnBIvmal2It0dDV/wa0Vg0b
         sXYlYSsXQ6EyImbhXx2UNCSSG2DS9gLj0o2GkrGM3c0917jetCVjEqCeaM/ZQ6mqkG23
         FeG2JjHVG+WO0zBLvM7wKfz+VFMmnHUjfQwYIuuScwDCR2naNXVS9Jt5CzjLkn7TMohS
         /6cA6XORQSsibYcEPYNRprpcDAV65dCgKM32ya5QB2ye+hrRelgdanY+0b4Ev/+hizPJ
         ia3A==
X-Forwarded-Encrypted: i=1; AJvYcCU3R1DGe3z2j2M7uccoYrOba8CfHTptnSqyO23gtuMNlLkCLdNTIyUHixd9BD1H7yptAvG5QpEcOfAfTA==@vger.kernel.org, AJvYcCWVb70xNc1VYq5wOgXy4lomDQGymv4eVwy0hjApldY06LT3/a26l/1gEPXkWDR3zN3qRGy0XqqSDQAS7nE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcGo3g6kOV1wyJ8BHJWb4dVZy3gjrsKDakXfWgrFkpT399N8L
	T2dOPBG1cQ1Wz/QTthkjIMwTerShihqqprEFqypCyrbkDQjTcHOE
X-Google-Smtp-Source: AGHT+IFuVKoQTQFMny/yuT3vo0BKylSf06Z3BFNJPHcSsPHHr+ulRz3bWS+YDcPD3QlRd8POiTtjIg==
X-Received: by 2002:a17:907:97c1:b0:a90:d1e1:eed0 with SMTP id a640c23a62f3a-a90d4fc8432mr65030866b.9.1726789561062;
        Thu, 19 Sep 2024 16:46:01 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f42a6sm773046166b.70.2024.09.19.16.45.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2024 16:45:59 -0700 (PDT)
Date: Thu, 19 Sep 2024 23:45:57 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Rapoport <rppt@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the memblock
 tree
Message-ID: <20240919234557.hsvajq4qp4u3mhtg@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240827150453.26bff4c3@canb.auug.org.au>
 <20240919145356.2f205696@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919145356.2f205696@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Sep 19, 2024 at 02:53:56PM +1000, Stephen Rothwell wrote:
>Hi all,
>
>On Tue, 27 Aug 2024 15:04:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the random tree got a conflict in:
>> 
>>   tools/include/linux/linkage.h
>> 
>> between commit:
>> 
>>   d68c08173b70 ("memblock tests: include export.h in linkage.h as kernel dose")
>> 
>> from the memblock tree and commit:
>> 
>>   9fcce2aaea8a ("selftests/vDSO: fix include order in build of test_vdso_chacha")
>> 
>> from the random tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> diff --cc tools/include/linux/linkage.h
>> index 20dee24d7e1b,a48ff086899c..000000000000
>> --- a/tools/include/linux/linkage.h
>> +++ b/tools/include/linux/linkage.h
>> @@@ -1,6 -1,8 +1,10 @@@
>>   #ifndef _TOOLS_INCLUDE_LINUX_LINKAGE_H
>>   #define _TOOLS_INCLUDE_LINUX_LINKAGE_H
>>   
>>  +#include <linux/export.h>
>>  +
>> + #define SYM_FUNC_START(x) .globl x; x:
>> + 
>> + #define SYM_FUNC_END(x)
>> + 
>>   #endif /* _TOOLS_INCLUDE_LINUX_LINKAGE_H */
>
>This is now a conflict between the memblock tree and Linus' tree.
>

Do I need to send a new version? 

>-- 
>Cheers,
>Stephen Rothwell



-- 
Wei Yang
Help you, Help me

