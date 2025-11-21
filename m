Return-Path: <linux-next+bounces-9127-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60388C771D8
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 76D642C267
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216229D297;
	Fri, 21 Nov 2025 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXcfFus0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539EB2144D7
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763694469; cv=none; b=GgXoPXTGkb+oZN4EPmhSvs5PUzVfMAdmot+pFdDU9arh0tdXIkDyUd5bJb10DWBskGCzRxu5o/P3ZCjHLJ90AjkoUCgmkfLVl1BFopuFZIzlPbNqXXkHokGHdTRnE+ryhbt06nKHOslxME2be2WK/+fmqNEZyZh66bmSt8qKqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763694469; c=relaxed/simple;
	bh=ouc9DyZfHR8CBmxjRzRgGlstcKTfEeGmlEkYUxmO7eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppOgPRu6qvlAL9EU1lLDFdhk8rIFpwUYW2zAnsTg8IirSP7bRLSQXKCdTs1ho9bFQAtNo1RyFvbbidg2fYOQfsCH023ww71XMgyrPFFI9yAbM1gipdLn0kChyQSMo4NaPHwOzufl6lLEdPPY8XfTljEoEjuX6vBtLnyrD2yzi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXcfFus0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1286027b3a.1
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 19:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763694468; x=1764299268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyR5Zx5ppucL82U3ohqQwuuO/leGQvAUXunzNNi66yU=;
        b=JXcfFus0UCdHUcVBlyBUDIcVoyg2uhV2/ScTZj/77XtUNoxUGivUn3L7SoSAUAZKDC
         rbD58sdlk2mCQ5KbpJwV0A95z/zbJ0lWgKSLYUUdvAFsUNFBe42l60ag53Wf4JsBKJjY
         zFhQWKa/8IoTuNCvl8umCUpZLVU3QnA1WGWNrNm6u+zvnBSGtFj+13j+nunyKMIorqnU
         jbMaY9LnNlXxPa0hFWNqPYHiKEjGayZzeTDtgADolkYUl4sNP11NSoFJKJbVsJl1dcFB
         QYkr759Ye/W+m/ZoV46ZqCo+1i8Wm0oUz7YtFfc3wdoRj38qIf6+l5PcE4eG4IKQLT/Y
         9twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763694468; x=1764299268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyR5Zx5ppucL82U3ohqQwuuO/leGQvAUXunzNNi66yU=;
        b=qXVZ83KQIje00xL6WUklF0ey8j61GlgcAJcA1cBeDsprSjCRNLI/T00ZBCIEaeSMmH
         vAKqXdm5HPJNhtPuTkZI7c3BQV98JiANISgYNZB8jPf6Fo9qVQ/9vj3SqtPlyrr27fZa
         Y4qOqgXnlT75+oIhpWPCKjN6nC9u+THqQxyvKNncTyWQ+b75aLDdJgrg0J5oY/O42WCn
         HDK7fuMkM5AJfI41/somXizS04G4pwo2NAhgf7gvjmO1EfAcfoa/a24rvxUlG7HVbg2Z
         c9y2eub7U6JWlFBhwT6aqHRgeMJ1mfVxQQdtib/GBMyErEFpRTHhYndUoMGPi9o63ix+
         R3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWsbcqc+pIDgQAm6K/bkUXJoYjD8Pg1695M2b5ilCuKaA6Q5mGjz/MSK1Zr1u6TsShCjR0LT9rR2gtb@vger.kernel.org
X-Gm-Message-State: AOJu0YwADPxmUTM9uqBqdU2LHPTuSz+evfPgGRlupdK7t5Di/DXzkBs6
	Q5IDsx5yO1J3QZfwZvQ93gdwpJN6jBiOAQQIKqeSbjYncA3JuLyllNBL
X-Gm-Gg: ASbGncufsOceAKx56A0qZxlC/9wD85Pux1n5WUgls2x+7iFsY4Nih97KwaE2SD2xocQ
	y1WYeMF4z+0DR3erwrcQi8n/L7YDHSRf0IuuGqafPmGFxFOLoIBYzMtQN2+YVAZYclBVRE4oLT3
	/qGH5MgaKB/lCSYPEQGzZUACx+0Y0QN8u8ImAc4ANA3zVzcv4YXVyz4xaky1+i4Ah2Yy19z1MCT
	rj6+XrVEObeQsdQSRfDlWPT/uRKZ+JDTKn+VOyhjiUKL8Wt67GVxqI16CaDvw7NwJl2FRuNwXXn
	SFpJ4nPigJqGRHrdcv6LEGOESfnceQLEgHPPAJCXgjf4CYDgcoNAwLwFeXcYjyeYdeaTmfTfgbU
	936kyOWnG0bAHgqB1K4GkiliaPGd9wQa9jEbnRu0S72vxclCMgy2YDiqeFpdnZs2xCu6684fn7r
	9AME850iTNKpw=
X-Google-Smtp-Source: AGHT+IFFp+DerL6QKvtBpxYcQ5uT+85IawSKcy7N3QekebF2gqFwa6uvNKj33pLKXt+TvDIkr7WjSg==
X-Received: by 2002:a05:6a20:7284:b0:35d:5d40:6d71 with SMTP id adf61e73a8af0-3614eb40630mr1178719637.8.1763694467510;
        Thu, 20 Nov 2025 19:07:47 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed8f6sm3905398a12.2.2025.11.20.19.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 19:07:46 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7A23F44D00F3; Fri, 21 Nov 2025 10:07:43 +0700 (WIB)
Date: Fri, 21 Nov 2025 10:07:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	Ivan Pravdin <ipravdin.official@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tomas Glozar <tglozar@redhat.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs tree
Message-ID: <aR_Xf1qyNMnxXebl@archie.me>
References: <20251121123509.5f07d818@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0Xx5hvW24oxy0X2"
Content-Disposition: inline
In-Reply-To: <20251121123509.5f07d818@canb.auug.org.au>


--n0Xx5hvW24oxy0X2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 12:35:09PM +1100, Stephen Rothwell wrote:
> diff --cc Documentation/tools/rtla/common_options.txt
> index 1c4f3e663cf5,edc8e850f5d0..000000000000
> --- a/Documentation/tools/rtla/common_options.txt
> +++ b/Documentation/tools/rtla/common_options.txt
> @@@ -46,9 -42,7 +46,9 @@@
>           - *f:prio* - use SCHED_FIFO with *prio*;
>           - *d:runtime[us|ms|s]:period[us|ms|s]* - use SCHED_DEADLINE wit=
h *runtime* and *period* in nanoseconds.
>  =20
>  +        If not set, tracer threads keep their default priority. For rtl=
a user threads, it is set to SCHED_FIFO with priority 95. For kernel thread=
s, see *osnoise* and *timerlat* tracer documentation for the running kernel=
 version.
>  +
> - **-C**, **--cgroup**\[*=3Dcgroup*]
> + **-C**, **--cgroup** \[*cgroup*]
>  =20
>           Set a *cgroup* to the tracer's threads. If the **-C** option is=
 passed without arguments, the tracer's thread will inherit **rtla**'s *cgr=
oup*. Otherwise, the threads will be placed on the *cgroup* passed to the o=
ption.
>  =20

The resolution LGTM, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--n0Xx5hvW24oxy0X2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR/XeQAKCRD2uYlJVVFO
o3hHAQCaQg8asSwx/iy02C49KRQSqv2jC1Ro6lcStxCmg21jFgEAxbAmvEFDzbMc
3BMDHKHLeA6+kGe2whg/wgUwV8z4Xgo=
=y1qK
-----END PGP SIGNATURE-----

--n0Xx5hvW24oxy0X2--

