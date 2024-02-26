Return-Path: <linux-next+bounces-1355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21ED867090
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 11:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B9F1C28313
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 10:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8004B53E17;
	Mon, 26 Feb 2024 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eCixZ4SY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9D5380E
	for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941772; cv=none; b=lYNhtNQZx+mq1QwGafDOnqNdmvsyRtzx3Ilolhq3lXOEXRkYB3OcbyDf7qv+TdrNWkUapaIbHpWgFr+3hmsTi19YMLDgzKPo6bZmC6x7K3xXvqwawpjv+BnJSQYI2F2pEGxZ1JGyLVjxHNs19zVzmQwvia3mju7g6hq9VXu0KcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941772; c=relaxed/simple;
	bh=z9qluFa8eC6JxuWAEfGLN12QJfch7MVKIgg1veyKQdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBO6oZ3lzyRERL/QCgqBsh+p+ir7osZFX9oImGRUk5PE6GGQPUUiXQ6UkzEnPMF2hdi4w3yk20GMz+K+ebAiUy6VT1AqyPMAzvZ6ed7ENhBYYC7RR4I44fxQ5cbdT48USNL0SqP8rVzMjZ3U3nlSct0gq+s61wNzPKmclyT/dyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eCixZ4SY; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4704c69a3d9so254285137.2
        for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708941769; x=1709546569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egKHCTXms3+Gj7uzoU9NwUOObz+iQsBsbBmu6x6wSpk=;
        b=eCixZ4SYxFA+rxA+XKO0Ly6pdswVQHlb3jWlNnZ9Z1eJLzUzHIUHEgLm0Y1moyB7f2
         imKgNToOIireEdLLNbIo1yUd+D8T+rK9lK7XVHqQbyJhiUjeo4604FIzF5Loz3HWcLtz
         AqTuOKFOmN8udhoRfuPflnPz5mLc2dQTMAri6GtvFA1lVgWN4F6CnW2nff60bFxYO5Cs
         u8ykaHP26kXGwuJqbl2u4OAGL6q15Zqxtw+P1q/OdcMwJ7MhWbIlD8tckYykYCK0WBQY
         FU4viGeN00vwuU+VJYStsU67IqWSKySg1mbFfSenfbEqao69AO7x/zW4POuQ/a7yWiUw
         M9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941769; x=1709546569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egKHCTXms3+Gj7uzoU9NwUOObz+iQsBsbBmu6x6wSpk=;
        b=BgXjHAwSZ8iZK9/u7PryFyD03rGm4NrK6irty/9LH1SRqD4xCdLWYKFwaS8RHR+Guy
         6I44SMcOnpOIXhvK0q9HeS9aBw9NkqIH578LaheqBu+BQKfOg44+Door3hzqQdqradEa
         q/lFzHP8tjGdUeo39C3wNoLdEZIIm3Urb9j2z6A8v4QcPtY4491Zfj9Eo0YbEjVDemTU
         BoM6wYIxJqdOqOwIiHOPjjSsZWgi4998hent1cHnip+6IR0Mzg/uXPl3hSoxqp753PJq
         6OI+b430qXdPraR9MJ9w9uS52MiC2aGoKCnN2tn+zSsWGI5FrcKjxsW1nXoJh4tw3ts/
         9O/w==
X-Forwarded-Encrypted: i=1; AJvYcCXfmrlXMU4NXTBuhwL1kUSEqUr8jMapWDBeuuyiZUMTvfQQUKY43X5LhUZCu1sC+2A4LDaKcWtjimI6ipSoXwyPbGzR/HTahhgpRg==
X-Gm-Message-State: AOJu0YxKT6OPZtiopcXgP6i8+H+6O1DpvPyjMlZ+WdCxxlp0fj8gOnnv
	Lc74BYI66OB6m/XsoLptYK8HOBjcGjyAxKGV1Hbfb3Kyt14U6WHnAgQcsHj4a+vm2vaOIWxof2r
	opdKLQtQiXOUZ69MTxVn2tBn/309kK124iy3/GA==
X-Google-Smtp-Source: AGHT+IEllPqSj/87WfKunHc6+bCMnlKEsFq9iV7Ej3YJerJemaazB8I5kSszVhUzvisTiryC2/gVFFa0SBHh9dmZ+Cg=
X-Received: by 2002:a05:6102:f0f:b0:470:547b:6f98 with SMTP id
 v15-20020a0561020f0f00b00470547b6f98mr5205949vss.18.1708941769713; Mon, 26
 Feb 2024 02:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226174117.722301b9@canb.auug.org.au>
In-Reply-To: <20240226174117.722301b9@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Feb 2024 11:02:39 +0100
Message-ID: <CAMRc=MctN=PqM6O3GxvcFuk2ZT2YcqTiKZiuCiaTnXDEV+gXaw@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the gpio-brgl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 7:41=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in the mfd tree as A different commit
> (but the same patch):
>
>   4a7b0850fc7a ("dt-bindings: cros-ec: Add properties for GPIO controller=
")
>
> This is commit
>
>   7b79740d42e7 ("dt-bindings: mfd: cros-ec: Add properties for GPIO contr=
oller")
>
> in the mfd tree.
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen, Lee!

I picked it up because I was already queuing the patch adding the GPIO
driver. Unless there are conflicts with the MFD branch (doesn't seem
like it?), I think it should go through the GPIO branch together with
the driver.

Bart

