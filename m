Return-Path: <linux-next+bounces-2234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F08C0746
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0506A1C2134E
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525F5132803;
	Wed,  8 May 2024 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4L8l6cN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75410A39;
	Wed,  8 May 2024 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206732; cv=none; b=CWsnwgbm3cPkDCQLAcdyA1Is+a4sHXu0sP9tSd2kdM4au+F5eNtLnWoq5XLL5ZwonsdvV4ynBThWQtOvLBOm0A+qvWVBYH6RejYSLT2AMocQsHqs5bb0TUXCI891EP3izG+f5FIq4yfpF/Ny8EJEmlBva5BqAwCxEGW5O9XlNuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206732; c=relaxed/simple;
	bh=hk4EI12Q7jwmN7X0zXm3b3knpgGxw3kmiPhClg2PQDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aK7PaBhNd4NbPnN1GhDG/WaQeSKcVW98OA1PJcr9074RVlzrlD+ToGj5YyeuZIZY2nFz9cHNEX2kSWgZoVqidqk5Qjngf5WbF3Gr8jrEuRV0V6ZiZDbIdzp/vUk9O02WKb3dgj4Ei0cOe287bEhN8CURGwUAGt1fHVUD56pY/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4L8l6cN; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62026f59233so2350427b3.1;
        Wed, 08 May 2024 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715206730; x=1715811530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCvKqY8i9XSMDGNd+q4ylNKE+7ju9dsZ+GY356qWwAc=;
        b=N4L8l6cNKc6wZVpveO9NuE/fDPVLOGGuo8gG5UmHWua04PUapr10hMMcV3vt9FQAZB
         aEHoi0kuxEBo6rBA1YjNmTEYKQ6l3ewJcdHrhfiHgnkWpePy7lYNzUor9/rSGwcqz/r8
         ox5QwsDfq9fjSAdvYeMaTO3jLiSREzD7ARgSgbx864dVmqG+EUhGoStDuG5QpX1bL6r7
         vYIpkRsOPwA8onDicDdHN0mZw1Q7tb6ft2S2XOFqauWc9ZkTMUeo/Ud7pdt9o3ndw9tZ
         gofRN1etFaVpLinTNOm8yegG3v7bGC6YZFPWizVQMFXxQFKEpTF+ue6wyIsDgxRXg62g
         a4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715206730; x=1715811530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCvKqY8i9XSMDGNd+q4ylNKE+7ju9dsZ+GY356qWwAc=;
        b=mb4kXiQKfw5jiJN+pj8oTFTc+spnar+fC5p06B8k4P/Vi6IdkaaFHEf2j8S1v6GlNg
         X9bDOe0gIFFtQNNOxOHQUjt6cD8n9gc3zr9w2xX4rca1KZuJV625bQydLW8EEg67HWZI
         Zuq3wkDDFmoS/2qyfd/wdRV1YZkGXDMi4dcUhrhpNw3AAAcN/6CZlh8+wne1UdafYDjD
         0U4AKxfmx/pSF6wS8hVxO5/yBAYTouv0/eRBT5uZwKAf0ratQPFoXnlqUFFnZ0/SZyIe
         fwNQnStdYNDclGb/PU0XpUdAEfeScrTndqCf0829v7Jtk57yfGC2toomH2aHMViDdYNj
         uC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfwhgdWj/6mV95GtrMU50UEQwJ640N7iBFwkHlvmYsIOmGuDsMZMGrX3Y1V4JEYOrIg8A2xEhHptAnw6hhd5DoJoZpxo0CJw0ZoW2Zq9M+4YyAP4xluyYHND/Y+aulgqKgbeR9OCPvTQ==
X-Gm-Message-State: AOJu0Yws/nWCIv2LOubCnV1QdbAK65VUP5Zf5o+K3JVz7B8EFaBVAYf4
	MNjCVjXsirRtXg55dHeFLfcmeIrVpnTss2YM+Cio5RRbbZtoBqWE
X-Google-Smtp-Source: AGHT+IGXYHs6Q7tUtU7m/CgNNmfuwvMbU+voEP0ez5M89FLmbv82MI3pidP45+1g0gEMfFbcbeUE4A==
X-Received: by 2002:a81:718a:0:b0:618:88d1:f15f with SMTP id 00721157ae682-620992060aemr8637257b3.0.1715206729632;
        Wed, 08 May 2024 15:18:49 -0700 (PDT)
Received: from localhost ([2601:344:8301:57f0:12aa:a929:f1c3:cc0a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e26eb50sm28187b3.67.2024.05.08.15.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 15:18:49 -0700 (PDT)
Date: Wed, 8 May 2024 15:18:48 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Zjv6SCS6WSCHbTGR@yury-ThinkPad>
References: <20240508162755.7d339509@canb.auug.org.au>
 <Zjt9GRTRgjfgtOwd@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjt9GRTRgjfgtOwd@visitorckw-System-Product-Name>

On Wed, May 08, 2024 at 09:24:41PM +0800, Kuan-Wei Chiu wrote:
> On Wed, May 08, 2024 at 04:27:55PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the bitmap tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > lib/test_bitops.c: In function 'test_fns':
> > lib/test_bitops.c:56:9: error: cleanup argument not a function
> >    56 |         unsigned long *buf __free(kfree) = NULL;
> >       |         ^~~~~~~~
> > lib/test_bitops.c:60:15: error: implicit declaration of function 'kmalloc_array' [-Werror=implicit-function-declaration]
> >    60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
> >       |               ^~~~~~~~~~~~~
> > lib/test_bitops.c:60:13: error: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
> >    60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
> >       |             ^
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   777c893e12fa ("lib/test_bitops: Add benchmark test for fns()")
> >
> > I have used the bitmap tree from next-20240507 for today.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> Hi Yury,
> 
> I believe the following patch can resolve this issue. If you agree that
> this patch is correct, could you help me fold it into the commit that
> caused the error mentioned above?
> 
> Regards,
> Kuan-Wei

Updated, thanks

