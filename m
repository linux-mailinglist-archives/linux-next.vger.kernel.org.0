Return-Path: <linux-next+bounces-8552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18064BB621A
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 09:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DE319C63EB
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731B12264C8;
	Fri,  3 Oct 2025 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYKwgotD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C1158DAC
	for <linux-next@vger.kernel.org>; Fri,  3 Oct 2025 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475118; cv=none; b=XgZmm1LpNPg581AqBrAQ5Mz0iRi6lKKQnkxcuBTAijOWjKoiy4pNcE1cyu7TH7UP8DRvcSSfL4/S/+NjgudYiGXEyiQ4rKUbgGjDpLspnJeperQ1YTney+fsoxq6ysKW5Npxj0qzBcBoOQJsC2Bp4P8linz9+9lJkdjLo2bqX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475118; c=relaxed/simple;
	bh=V4nXwYJCm0qAgWBhMSc7xLQVPqXoKoYttkP89beAoNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1iNWHxpr27nnHtbmmKIhQ0DOxZPtSDCV0zsf1peAu2QWoNss3Uu2dHyBeGVmDdrMMJ0sdWOjbtJQY4w38GpVUKixxkf7Ja9BODkADd5kL+GcXSXU6WwBH9pZ7DNi78+jfRHgDtZBIN6vSKp46/BNbRAnT51kLvFuyHC0vcgQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYKwgotD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so937172f8f.1
        for <linux-next@vger.kernel.org>; Fri, 03 Oct 2025 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759475115; x=1760079915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WYt7I8mRkr3Ey2EwDvEAd59xCd1pgQeHenRaMjT/0TQ=;
        b=sYKwgotD7CgXw9ZxgY3uwEmRCPi8ATgNWzz52NKU4TPFuw4X6k1Swg5DqW6HhP61R2
         z2v0v/MkQ5+xh6sXCmegmI6/lp8OcBKcLcVwnpo5lg/8pkj4pDmHa2oKT4ZCdicfchvL
         J+8AlLXwjQYTi5PzQTuipbWGxbAPqhk+IamR/u4h3cfjxjdMLc6xs47x0BHGJzQu/sHt
         socjSeS3CoebE13mdhAAWJvHTy+K3nXKtJGONRLBTptsYEymaEabsFsVi36xfXGmN4Fm
         lpE0qto+nlxiIIaQDg/rcSjcpfkFGCEuwVDBNMhHo84zZ6HGAzEwDMvK1QVRQk8NKHoi
         5Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475115; x=1760079915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WYt7I8mRkr3Ey2EwDvEAd59xCd1pgQeHenRaMjT/0TQ=;
        b=O+ZNlaiZHZ7G2vn86PtZCFGyL86+ZxiuzzGnegrZ95Zf9YGZLNqwRNqX53c3dRmscB
         aZjCiosiWAlvrucAS/BIGxSTADUT7Ij+UXK8GXAPbBUHy5GZJWwMMkAQKkQxu6Ukh5tu
         kFanqWaMvpixkkwupqWOk1scu9RsQAAip3mwP1slNsAIVHjPEmzLBN4boYWjG4rubnPC
         n0gHilkBNhCr1k9ab2GIn/uIpDSKmXoCcNbMxIVBCC5KgedtUF0p/JHtw+gHU0bqDuwB
         m94ws53NDlxi0o78m3H9RGtl+JNna4An5qacV5VGXvUU/YK5GZMnEZpc2irWC8G54qUo
         rJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWQHVeSQKjXcWrDI/56jB4QliFY1NfjD0nfPEKgCfXWMXlJOYg7XxDjLsI2ASFt2oY7Cnz4pdi+3Ypr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OFJXL9J2TH3vRqk1a1lMdvZox6z+aUT1M+O2EN7w1LU72yzq
	dIyozT5mbvQKa3y5uRW3VT50AUtPPXGr/7mX2mVVEXB6X9o9p/ZE70EuEUknPhTl/KY=
X-Gm-Gg: ASbGncuWN2mhtGzrKnk9C9gWyHFeE50VFru1OKLM/B+e07eaxNXMm1Eb4ftHmejJhXE
	9tXNTqB7XEsHlRMcLxOiwPOv4FIbbYwIEcmPuTX7KESDMPqZmw0fwriHv1x/rXBnuS3W1hWHFpW
	x1UM+dqaMFZ2wqO5y+raN8i3nIVhHD1hweNgIaRRRNzb+wnaKsff0E94JnMNwLekM5PwZs36/iH
	i2jSyelucwqyZLgJPnCLzgbaKLE+l/8ug86NF1NHlpGpb5iYA1tXaMj4NUTFOfSRm8ijt49AU3r
	DxXNXK3QaD9m+CQ8uSWfqLjLAHcXUmB3+dMG+5TFljtTCwFN0BKJKLjnMFwV1VdW4p/lgYigDCy
	DEOmdYYvKXIGzWIRfHGv/4BXWj7Aq2xCX+zK2w0zMYMmXahL5dSxgcL+h
X-Google-Smtp-Source: AGHT+IEKWMNU5OX3+ORzmomh1gz2zjLM87JREtHvmvNpMc/EuUWnJ8BWX8gvQHfL5j0uFQFyRdFpwA==
X-Received: by 2002:a05:6000:25c8:b0:425:57dd:58bb with SMTP id ffacd0b85a97d-4256714cd43mr1162661f8f.22.1759475114640;
        Fri, 03 Oct 2025 00:05:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e7234f69bsm18356975e9.8.2025.10.03.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:05:14 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:05:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aN91pwLmB_2TwK77@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
 <aN7cRUOxq-zwCoZN@stanley.mountain>
 <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>

On Thu, Oct 02, 2025 at 11:35:10PM +0200, Miguel Ojeda wrote:
> On Thu, Oct 2, 2025 at 10:10 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> >   RUSTC L rust/core.o
> > error: cannot find a built-in macro with name `define_opaque`
> >     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
> >      |
> > 1757 | /     pub macro define_opaque($($tt:tt)*) {
> > 1758 | |         /* compiler built-in */
> > 1759 | |     }
> >      | |_____^
> >
> 
> Thanks Dan.
> 
> Hmm... Strange, it is the `core` library, which comes with the
> compiler and thus should always work.
> 
> So it sounds like a mismatch between the binary used and the sources
> of the standard library (or perhaps other kind of mismatch, like the
> wrong edition being passed, but from a quick look it doesn't seem like
> it).
> 
> I will try to reproduce it. Did you happen to recently upgrade the
> toolchain(s) or something like that, by chance? Are you using the
> Debian packages?

Yes.  I am using the debian packages.  To be honest, I don't know it I
broke it with an update.  It's possible.  I am all the way updated with
`apt dist-upgrade`.

I'm on rustc version 1.87.0+dfsg1-1.

regards.
dan carpenter


