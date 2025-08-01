Return-Path: <linux-next+bounces-7821-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CADB181CF
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 14:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 378B57AB043
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 12:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9924D1A315C;
	Fri,  1 Aug 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqBQ3O8d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3521CA14;
	Fri,  1 Aug 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051458; cv=none; b=B2kkxu7mdhRMBHI3RDzRPeQ0GBKJw9Zaf0BQF4fL4gOl1YwgaMz4wlS3sosnm4MquVqJ5c46J/nOnA0z5bTk20U3R+Dm8rdWwHRk95f8auklVHbIwiouIV8TnKjZGGZSnKGqFzH6zXQ3NzZ/bFeHUD+XkEqNr336c81QRuUwXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051458; c=relaxed/simple;
	bh=oTT6Qz+SneJ5LxxvLs9eP6XXlBe4Gg3V73pIe4Tjo9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYpydD6VDE3OVMv8Oe/zkT7LupWAlMyPeQOa7uzDWXxj6EdBH1cWHQ4hGgLa1aqh//k+baji8+pfbQNoFIgtA5KAToI5caaG9qImSe8dA+BLNlQAXlO+vPKTuEP1OIkL1Jo0DVJOVZ/Nh+ZE5aVNVeb2Qu8yoYLs9ttmcHgY230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqBQ3O8d; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7183d264e55so22051357b3.2;
        Fri, 01 Aug 2025 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754051456; x=1754656256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSzDDzXl284InWcvg3r7d40H9tFzezH31xclbEAuGIc=;
        b=bqBQ3O8denRL2nVzLEN4k1/CKulyej+hgG6b+zHkLG7DXHo7j9SB/A/8oRuGk5WIcd
         HyY6FNYsHsvup57ST0Asm11Yo0fZXZApNiWdPkcv/qOk9QgFB1mbLmWuzFoA1aC39EU+
         jXW8Nbm9Xomh09fhEiXTG6aWU5Ru+8P3tLa8KfVvbN5hV+/ngYy5jI30dgXfkXL6tkA0
         Mrw8rPmILfTDHCRu8sIXZIvLCUCBrtwhV5kyUUz82zcW1VAf4WQ2azRf6JS8yief2ScM
         DbSGgP0cZikl8Dn88ADYWV+NRFwVA0dkZWMCe9LO2e0B87bgpcSQEwWG+PO0Cdm93gO+
         LVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051456; x=1754656256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSzDDzXl284InWcvg3r7d40H9tFzezH31xclbEAuGIc=;
        b=sMApLidrG1HSgyFr34Hov/Lr7SOgilixbLAJEAIDfYi6mG+SDgkZP0wOgLijMTV8vJ
         cQgK1ALTr+71nr/GcpUrL5iZKtmfgJGvaPxyPYlLqyNv0+WZNRHdu28m+2NHlUs9Rg9e
         o74T8om1A1Fx+mKAYOhmG1WWmIqHTUm3SRk3pHUhhEPgC51zbQNuPotNZp/iAbTloxsr
         L4V6VHXyjBvwKp15snoZ9q/i7F1ywMcJrctiS5/djxEuUhUisibFjYJS+iEoC9fBBwl3
         xu31sywmi09lrETzoCkOp3j9KLto8aNtlm+iDri8eG9daS7G1mP6uTQq4exmweMFIMi1
         fiOA==
X-Forwarded-Encrypted: i=1; AJvYcCVNflKvBc73KhKWfL5pu/l59gZCnj80ZHRXaAz232AHP4DFufSyidNTJTLzCrAJQ7KIgprKTGNeztN9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYCISVhOMzfcsfhvFVhy/HEY/Rts93ZvY7pHpwFakXnjzhyT+
	8bHu3EoF3ja5zvRtRwayjnl/yHelcBi5sLtSglGTYXgKsTMHP+gmbPQ1qem65Q==
X-Gm-Gg: ASbGncujPDqs9rVV+ikTZ7JAyzwpN0T6s3uCwTBnnE3/XxKaFs2OKiwIHoAboJRLuuT
	lWhvJpVIds89dMmeyXU/cbtMSLTPcTbNc9gdTxRBUmOKyg8MnliWCu04TYvTa15Uk6umNi2wzHZ
	reeu6T1aaDEOkyWDJM+qJjeyLjXa1UIlZiUddWmasDT8/KKrLC0YUhrYXoaD8aszAM/fB47qWPM
	wUrzEFpKVAvjUJfLCgGH2Zjfq02A+sz0kw8x5uyPICypOMvp/hhdcSt96ihNPU1YVibH2LBdONg
	EhydoLsEkjziKcQWZdhE0gPQIh8bI10P8JwZyNZ9Oo8BAP5uPJ8xcbSrQDARlKd5O4pUdOfwtAI
	o4F4JohQ2/voAVVgX7ID79vdx1KFamqVQ8Q/iy1YaegBeCsA0Oo7hZfS3Bw==
X-Google-Smtp-Source: AGHT+IHnSF7IxrMCWPAsp75TMyLWYuoSVW3eY65SQAqayjC8YHfZdJ/gTrO/YYd+RG4DP2TkQpN6jw==
X-Received: by 2002:a05:690c:c08:b0:71a:23b3:13c1 with SMTP id 00721157ae682-71a46539cd7mr142719057b3.7.1754051455824;
        Fri, 01 Aug 2025 05:30:55 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a3a9b63sm9775627b3.13.2025.08.01.05.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 05:30:55 -0700 (PDT)
Date: Fri, 1 Aug 2025 08:30:54 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the bitmap tree
Message-ID: <aIyzfjoZuzN6G6o6@yury>
References: <20250801112727.17d6e604@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801112727.17d6e604@canb.auug.org.au>

On Fri, Aug 01, 2025 at 11:27:27AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
> (all the commits in the bitmap tree)
> 
> The tree seems to have been rebased for no good reason.  Please clean
> it up.

Hi Stephen,

I didn't rebase it intentionally. Anyway, now the tree is rebased on
top of master. Hopefully it will clean the error.

Thanks,
YUry

