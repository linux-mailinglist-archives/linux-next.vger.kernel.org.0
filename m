Return-Path: <linux-next+bounces-4644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E59BF078
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 15:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF3AB1F2224E
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 14:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB701F9EB5;
	Wed,  6 Nov 2024 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pOqZKAru"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3951E0480
	for <linux-next@vger.kernel.org>; Wed,  6 Nov 2024 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730903759; cv=none; b=Q84SMq4yESiXeVKwPSadx9apLphJqVaqZxcg8h2Zw02xcLkshMMmbtN+6+THDPbydVTax0oETVe4oxXV8HdJGsrDPOH+0hsm+lMLgZsDqwBj1Xuk6ubOoOGftieSQ3orM4oRHARnDCnjGGV30zYIgLj/uAEWF2XcfHExQVWxKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730903759; c=relaxed/simple;
	bh=080kwCRCRdkmE/TzpK5Qj+EOoWKaa9YgsheLW6NelX0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPIeYDyyJEaMWORq9hnseClZ51rNpvDgfbbKpYJFSHVjwomj4IIdkmUnJlV0i8Q1pJNuGp67GtQH+WMEqr6KenundWcmrhOiQh7aaUcoHR6SYhcTfAqeh1nNt0jNwG5pVDg/Uo4edcFaZVNhjWvOSsKK4S2B37bB3pyyY6Qv10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pOqZKAru; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d462c91a9so3979220f8f.2
        for <linux-next@vger.kernel.org>; Wed, 06 Nov 2024 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730903756; x=1731508556; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9+kLT8fwQF+VisOzbqktbovvJZiJw5boQkzTlZOAVg=;
        b=pOqZKAruil7fx10wfu8o7rzvAlviEjr7fGo4DeIxS8bW7+CtK1ghOZSdimt4eH50nq
         h7mtAktiq7gunVhKMMiHVNz06iPueZse+atuTw0D0JDAYAGvJNvzhePnmc+7JZoa4AlN
         S6Km72c2QlTUUO0mWLn5JOklW8nh/xoeuoNA7pi/Uj2kWrjVqp6Ak8QCxDfBehVUJkcf
         G79Ios49mwPwkRDjX6wXa3/7SuwexMV+HuMKpUCSNWLVr/PTgdGzWRRvIbsMTFmf7YOx
         FmitVy+Xjp0NV3Z/HaNBsFoSTf0NPNTV5/kZegpza6QGiiy4Ysh02O2VHtk9EfF8kfpX
         0mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903756; x=1731508556;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9+kLT8fwQF+VisOzbqktbovvJZiJw5boQkzTlZOAVg=;
        b=DPViJnaR5iZ+B57W4qlmSQy/9xTwXmRNXdERWkauVcKBcmm2pwCKuO0mSXNQZzXpZC
         Q+00YGprm0NtkFSoyHwTGWG1nrFU+vElcFyjfGA6IeFpxfyZUPAdTOl74RFUma+hoSp/
         ekWfri2mBINa/zT9xRQ6MuuFKLJo3fSlfWRkbowgt8yVDFxfOuLCAblG5K99irwuK6r0
         GH73EBTOY+vwz7VcLP+7Ir7lMC8aEH+BtDzrZE7RNHjwf9Eav/QH59DIcOE7qPXQJqpd
         p4Mw1t3U02enHEpJ/4FY2Wzq1FftuCZwUO5gt1fTzwh+5e064WF3rSL4cDnZuNOni9Js
         1VNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn40gaoVeOJy7FiBOtVsEOAgLBvczR3a3Iyv/ujX+4l54deSYrPEQI5HAO3r1U7jgq6ZI5uZA5Dhwa@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ6CpAJRjwSH//HI09TYAde+QQsOrjdRJjdQvte05sqeq3oZQV
	pDS1Bg/M4A75dZBRhAVuYG5cO26koMpdu6uXpwT01Sz94Le6HqRhCfE8Yg+tWYI=
X-Google-Smtp-Source: AGHT+IHWUC8l8dqZAeGztK8hERGM5R/8N2vD+pddtLkxsIut0UD20HRLmAwh4EmgLau/1s27SYayIg==
X-Received: by 2002:adf:e2cf:0:b0:37c:cc4b:d1ea with SMTP id ffacd0b85a97d-381b710fbe8mr21214045f8f.53.1730903756115;
        Wed, 06 Nov 2024 06:35:56 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm19346662f8f.106.2024.11.06.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 06:35:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 14:35:54 +0000
Message-Id: <D5F667J7SSUL.10XNIL8QB6480@linaro.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the v4l-dvb tree
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Stephen Rothwell"
 <sfr@canb.auug.org.au>
X-Mailer: aerc 0.18.2
References: <20241016114013.37522900@canb.auug.org.au>
 <20241016081419.1d65c93d@foz.lan>
In-Reply-To: <20241016081419.1d65c93d@foz.lan>

On Wed Oct 16, 2024 at 7:14 AM BST, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Oct 2024 11:40:13 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> > Hi all,
> > The following commit is also in the mm tree as a different commit (but
> > the same patch):
> >   c5120f3b20a1 ("MAINTAINERS: mailmap: update Alexey Klimov's email add=
ress")
> > This is commit
> >   d6f369d3d989 ("MAINTAINERS: mailmap: update Alexey Klimov's email add=
ress")
> > in the mm-unstable branch of the mm tree.
>
> Heh, Alexey sent it for both Andrew any me:
>
> To: mchehab@kernel.org,  akpm@linux-foundation.org
> Cc: linux-media@vger.kernel.org,  klimov.linux@gmail.com,  srinivas.kanda=
gatla@linaro.org,  linux-kernel@vger.kernel.org,  alexey.klimov@linaro.org
>
> making it being merged twice on different trees.

Sorry, my bad. My impression was that updates to maintainers file for
drivers are pushed through subsystem maintainers and not through Andrew.
Wasn't sure about destination but looks like get_maintainer.pl was
correct.

Thanks,
Alexey

