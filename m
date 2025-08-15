Return-Path: <linux-next+bounces-7953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B5B273FD
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 02:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E926E560260
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 00:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C03273FE;
	Fri, 15 Aug 2025 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjZ+AfUf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95305A41;
	Fri, 15 Aug 2025 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217642; cv=none; b=TSLe7TiKHWOm40H1IB3K9YyWyqgVMRjelyIkl2LPH8z1no7KPMphnqMJiXh84g6cB0H0uE6Y4j06b/zXn61kedgwvFudWh8+stXcFvnqeCcYIcOuGw1sw5ARFVT8jb8H5PKKWLRUO35C5Q8mZsagk3DOx7dqOITWMSz7Cv5c1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217642; c=relaxed/simple;
	bh=M7dS2He6qJHDfyev4NVDw/0eEREJOc9PH8qqwnKXWXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D04fNxDdJg9VmMP+Gw3x/gVL3wxRTMtAQ1+reSf+hwwbfD38Ys56PmbdK0mJ5Ya/84g6MHTMaJq4Mt5Z7oJvQ+rmMIHIWyhk7xx4AlgWkVtjkuQ+Ka7dUJKTwoKD+wVXlRONGsyU7yVgnAkkeBYuGzu6hCS3YG3NJuJo4uH6+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjZ+AfUf; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70a927f38deso8846926d6.1;
        Thu, 14 Aug 2025 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217639; x=1755822439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwi4JbtBgHoq6oxpOqrxMsCU9YQdPYpTIrVUxknq7wg=;
        b=BjZ+AfUfA6f0O4HNN0x1AWi5heJHq8P9jucNpEuMiFwVKgcO6uFkZu+L3E+uDyBOh5
         XBS3PqvGDhmD8Dfztxy6yC1cXHu/iIKEZ01Do8jQPveRDUYN9nN0LK0ckxTlmUW6bT3j
         vsVDwxmbrihi55+Z9Bf8X7fDElw2ybB9t1I7ASgOCM+o9vKKYOq/r1xA6JNPcfRYJQsf
         4zZX62H2LYNAPGazjXrwmHT1V8E7uCzZ17TZmEHwvmQlp0SlAUyCYwYGI1UlGkKeC+Jj
         GCUvEvo55s/4OfYQ+Xy++gri2uYtt1ZBy+70QyzJ9LDono9SEGyKbX9ZJf/asMWcqJ9T
         p3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217639; x=1755822439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwi4JbtBgHoq6oxpOqrxMsCU9YQdPYpTIrVUxknq7wg=;
        b=JVZ/1Yc8gk6fgKlLyxvIghq/klQmIOJD8urIctUtLqtVyXA4MKn5zOLWHxZeB6Mqnw
         juDpH/NdDdu5su+ZPRxoTKaO1T7E1PGUvY17gJYMq8FFM/GGoflLh3DAoy3pXGSoBEoF
         ATSY/1XRJ5kuw+oFriWAp+c4vsnbUeRIx87Zw/sdr8A/VeOhI4l9BJo8FAOtKZUkQfSZ
         Z2SoF/t0LfLiCk1JAZVn6jMDUCcld48qnhhNCnEr4hkwodjnkdgppDIorUK45htDUCCz
         lTkDfGwAlrAZwmBBuasbvHFWrCtqplNL/t5VFyo6kyGIMetoj9RzsEuUH3wT2MbDqBQO
         2Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCVIOLZH4JpQTCqEGfI2paCmHbCHXDYKYW+Hu3o1qf80ehTeHT4jOjfq28GLUibCFLrCO3HebBFXqimc@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5My/R8z7kJ1UTGEM690/zeNsQvGQp2EA6tSUIgC9zIYXbvlv
	nvhigzxp9mzrrjj6UYQpXpMcUmea7+TpDJL2F0exj5JP6u2UOf+xogAR8szIYzaor6SWDmcrdWq
	8cc7f9w3WfN/W9rIe1MYGzfMVM3ys4B/WOA==
X-Gm-Gg: ASbGncuTMfromtUaJcGw1F2BDGVuVjvwWUo9MKxS8+ahGKR/K1NWlyZ0J8YbB2Z2NXj
	Kd4+UhoDu5vWoDbo1LEsuPhLwQhtqBiOWQmx1L8gCdcG7xSci13mvnAwE1bpshlHdco59I1BLzs
	wJsuz0Fh5L+VhGkUmjNDKqmpUXadx/0yLiMdA5DN3mdchJQUkRq8rFR2zzH3aATZWePrOQ122NI
	SiOY9+5Cfo3GO5j7K+1xe9ZnOFACfgigI8di5PnTg==
X-Google-Smtp-Source: AGHT+IHLi/+00G1TKJDoAI0bcsXiCjri1Ys6hfQHuXSVR7hBrQUbYGB6Tw2W8btKDTopZo0aoFdOZeNgIZ5XI2Udvv0=
X-Received: by 2002:ad4:5be5:0:b0:707:69ad:d85f with SMTP id
 6a1803df08f44-70af5e64b43mr77212846d6.51.1755217639368; Thu, 14 Aug 2025
 17:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815093223.0ad56629@canb.auug.org.au>
In-Reply-To: <20250815093223.0ad56629@canb.auug.org.au>
From: Steve French <smfrench@gmail.com>
Date: Thu, 14 Aug 2025 19:27:06 -0500
X-Gm-Features: Ac12FXwPQB8A95cDV0RbA5z48J4HxreLC6AZCGzECZ7p0kMDtL8rz9j8oF3bydQ
Message-ID: <CAH2r5msUVf8HOVDr24EN9rpzsgDM=mTtza6A+2zskOPd0Hst9Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ksmbd tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed the author in the commit, and updated cifs-2.6.git for-next

On Thu, Aug 14, 2025 at 6:32=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   862d28dc8b48 ("smb: server: split ksmbd_rdma_stop_listening() out of ks=
mbd_rdma_destroy()")
>
> is missing a Signed-off-by from its author.
>
> Actually this is another case of a mailing list replacing the sender's
> address. :-(
>
> --
> Cheers,
> Stephen Rothwell



--=20
Thanks,

Steve

