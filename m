Return-Path: <linux-next+bounces-1022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193184B5B2
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 13:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8A1286ACF
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 12:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D88412FF73;
	Tue,  6 Feb 2024 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVKFo0G5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AA12B142
	for <linux-next@vger.kernel.org>; Tue,  6 Feb 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224215; cv=none; b=VlULVhSujSfLR7rfyvOj5WN9YCpdo+07bRyIPOCDRSJK96dVKmw2T+QM4kPmA2Bfpog9VGC1lJ4Z88mS7ZsS2l9xFZDjFGI1tZt4evPW7THe4HmqweXKVORuln3WQu5KZsGsKmAgOmJVINr7u/x5S0ZQVr9rnjfMTwmHIJnr/04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224215; c=relaxed/simple;
	bh=5nc+dSrwAnzE25GipJSV9pefmc4RGp+04RrqQWJYpRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5ixSRaSVpeNd1br0hk5AmPfGLkioChXvb20BoAZJPH1daNdLGdAUo1vhQBYQuGv238COJ0rJDwXnIueo6ghI9p5FzLjJDR6l8XAsV7z9H13erIHKGCY5vgsU4z1d4Iwu4q/oZcpPla1Z0q2zZaNcXsQs/jL6oAytQzGHfh8UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVKFo0G5; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4affeacaff9so1826689e0c.3
        for <linux-next@vger.kernel.org>; Tue, 06 Feb 2024 04:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707224212; x=1707829012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AGJfUloIH7xui8NFEtstIa05IECpt+Jab8Vg6t76P4w=;
        b=MVKFo0G5yWZsFjQnbNwhW98ZKBxSlpbKPOE2/9YwgJNutprtBjxNG0dwyzYGjQBF8V
         7LozfmDeLgLRWvC0XHjVvKmPmuTJJVxPeNIp03Uv+LaPjowziqE+Fk8TBtFBsPfSeFTW
         rG7ir/W6LElanTcwyBUtMVMz0R+/zgtuKPOuUHWJzKUZ3b4iAkTGwlg07N7B2Ft4oHpb
         wrBl3Ld9Lw6kBuphNyb7YHw4JDdmkBAcaHoZieOFbvusmiqMHp37TMvzTsYmR63ISyK9
         2qC1073eEH8ffHATaXSGliClRYOxzGEueQW4XO3DN/2ylkJ19CDJDXSezfwYo55Wujmv
         5YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707224212; x=1707829012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGJfUloIH7xui8NFEtstIa05IECpt+Jab8Vg6t76P4w=;
        b=CmCDh93he1mKG9ILaO+QNs0Jh3c7X1yfVBkt3bk6D0IzkX/OTIc3pZBE9L+5tfMP9h
         YRgnoLyXbojqObPh6smDgKEPB1m4+Nlde7/CzjmBcKztwNhGdLstLL/JGd3rKAe6OQQ5
         V/CNpjUPuEeAK4NIvAS3K1Utc3WZaVwbc2gxAI1MVlYlmFVJ7A9QdafyYi6gUqXd+wtz
         VaWO3CcxNLfT8WVoule/Bbcx/xSLKFfyz7qDmqsPemWJ7otgSckLolrQ+qgM8un+HlOt
         28Wi5rQc90s8Day0iHFBehgQMbdJtjRIh2E2Qhf8cXNKuENzZa6qyD4A5NMcz138gyNA
         yxLA==
X-Gm-Message-State: AOJu0YyKKWcVjVCCA6oirDy2sGDk1wiuthi7A60q0TpZm9TKlQ3bY/GV
	3MAZki7psEqw/4DDi9olvqybk8SQYnRreauqlE47g20tLA6ZFr1ZX56Z3Ip3SZKOdHOB8tubaM6
	TG/LvkTmfeKKNY9kqYlSgaEuKtcl6GcbTVNwcug==
X-Google-Smtp-Source: AGHT+IFS1PZd7e63zNC9r8KPu6xCRNyWYmZqFgNbrdl0EFkTq/aO1Lm+I9bc80TlV88R1TjdJ7cY5RYVnQe3pc/jcBs=
X-Received: by 2002:a05:6102:303c:b0:46d:2f1e:3d15 with SMTP id
 v28-20020a056102303c00b0046d2f1e3d15mr2561235vsa.35.1707224212310; Tue, 06
 Feb 2024 04:56:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYttTwsbFuVq10igbSvP5xC6bf_XijM=mpUqrJV=uvUirQ@mail.gmail.com>
 <20240206101529.orwe3ofwwcaghqvz@quack3> <CA+G9fYup=QzTAhV2Bh_p8tujUGYNzGYKBHXkcW7jhhG6QFUo_g@mail.gmail.com>
 <20240206122857.svm2ptz2hsvk4sco@quack3>
In-Reply-To: <20240206122857.svm2ptz2hsvk4sco@quack3>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Feb 2024 18:26:41 +0530
Message-ID: <CA+G9fYvKfeRHfY3d_Df+9V+4tE_ZcvMGVJ-acewmgfjxb1qtpg@mail.gmail.com>
Subject: Re: next: /dev/root: Can't open blockdev
To: Jan Kara <jack@suse.cz>
Cc: linux-block <linux-block@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 17:58, Jan Kara <jack@suse.cz> wrote:
>
> On Tue 06-02-24 15:53:34, Naresh Kamboju wrote:
> > On Tue, 6 Feb 2024 at 15:45, Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Tue 06-02-24 14:41:17, Naresh Kamboju wrote:
> > > > All qemu's mount rootfs failed on Linux next-20230206 tag due to the following
> > > > kernel crash.
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > Crash log:
> > > > ---------
> > > > <3>[    3.257960] /dev/root: Can't open blockdev
> > > > <4>[    3.258940] VFS: Cannot open root device "/dev/sda" or
> > > > unknown-block(8,0): error -16
> > >
> > > Uhuh, -16 is EBUSY so it seems Christian's block device opening changes are
> > > suspect? Do you have some sample kconfig available somewhere?
> >
> > All build information is in this url,
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2byqguFVp7MYAEjKo6nJGba2FcP/
>
> Thanks! So for record the config has:
>
> CONFIG_BLK_DEV_WRITE_MOUNTED=y
>
> So we are not hitting any weird corner case with blocking writes to mounted
> filesystems. It must be something else.

As per Anders bisection results the first bad commit pointing to
   ba858e55b205 ("bdev: open block device as files")

- Naresh

