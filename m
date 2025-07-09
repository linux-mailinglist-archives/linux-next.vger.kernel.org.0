Return-Path: <linux-next+bounces-7417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED0AFDD8E
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 04:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4922189ACAF
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 02:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8B11D8DFB;
	Wed,  9 Jul 2025 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1HENscD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE21C861E;
	Wed,  9 Jul 2025 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752028752; cv=none; b=M20LAPrVU0wpo2AfGi/31O9Q0AO6mv8ye+QeX8wSS/uONW6XGK490i0Hi/kmtIX5Wm40LxfG/r8xkedIvH5C1deOSj5elnGrYvTJfIsUSPFN82xBLgdr4ofyZ9equcggJx9Xaqn8134UHcNglFafQYyUFcSbJssTIBYI4HC8b3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752028752; c=relaxed/simple;
	bh=2MFpJWPU8CWzunTAGDSW4LfrQNGdoBGczN7wNls5VGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMZ7YECr0G58A2kWrPOAB//XIRNX60DH69xU7FK7EQDPjEiOHXEi8oI2qSRV69DpFKz0SVqmpqCuvwKMnuKiXLEs8au5rZFhVBrEBy8OZ8UiXP90/ACEKz1uUpsr+C/yqtL+B3aS0wvAVoFA8b7KssF4yvsr8ONqqM/cvdZ7a3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1HENscD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2363616a1a6so48377865ad.3;
        Tue, 08 Jul 2025 19:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752028750; x=1752633550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2MFpJWPU8CWzunTAGDSW4LfrQNGdoBGczN7wNls5VGE=;
        b=P1HENscD6LEwpBWabENEMASecRUXU7Qh7IP7xSUKi3MaBsXvwr9A7/y9DvoUVZNeh4
         2QOhfTVlYIXEQVNGbKvHGHwHS9ous4FbucphaQ4VvG2nIeyQMoR6kFyysXuQGgcKcAmi
         V5cH9UDmirakTg0bOTjlNJWBFS3CLfIcVwtdYCNBEqUMJK4s8UKQBv3VIjIjlHOUf5Y/
         Zr6sTlQuz5VZi/kTN/Cdsaw2JTMUV7gz10ra4NtJz5FNY4tcLGHlxynDn8c0R5TGvxrP
         lZ6vhA1bkJwyNmV8nKIbiOsHUPuf+O0/Tx6suKrst4IJojUQPNcBpcqGEm3LICMSsI6M
         x+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752028750; x=1752633550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MFpJWPU8CWzunTAGDSW4LfrQNGdoBGczN7wNls5VGE=;
        b=xLdllJXQa52kwgzOs5JVp7Zhd6TcN4smC0K+A8kmevT3vKA5zkTvd/SB9RfC0vfuNx
         7JROunvNDJWn2+D0YWqHAPbjtY2uwDu0iEHzC5pXJDsu3nrj8TjBoJsvUt59fCJpXD1I
         ZXvWUMiYyJL+aBLbE8MvOx9ntsXL5DIQ6UUhiX/eX4/q75ItUKLHzdGvhigyL4FHLDnH
         wNZ3wI40d3rW5Zx85V9+8D0RdGyjdXWAeTx9btDXGmrN+erXOhcmkEH06o/kdDmBAmhd
         x15PZWLUF90b8M/qfjW7isEQN9erf0Jwt8b7dU/LXrcLJ/5TUlooTUY2mdzIXE8QrhAW
         JA4A==
X-Forwarded-Encrypted: i=1; AJvYcCVydHS8TLbH66v2CKh4hGJmpacW02DddcoLoJXsLIoV306TaZyWq+sdlceK1dC6SMDnmqO0/P95BSt3rQ==@vger.kernel.org, AJvYcCWadhxVdBJjL52FVQ1xDsqs0C9JfUv02NETGPBUGODRvcTVTUfFngNGJ+1IXKvjMMUk/6koEZMEvqYSJ60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRQKZwcU4ou7fYdnoJmL2TZsFSdlS8LvTaR4SgIO7jxiDicNR
	/vz0aeo7NLGifpY7iyPfTG8Hz78YulWqZm/zZ0wE+AzJgQwDfOIRywtq
X-Gm-Gg: ASbGncs2cqhg7Y+Gyclx1mEgbZbI/6sLVYj0kQAELxMeHbyCW3+UAuDLBU/o8YV+nGz
	/bk8HuDhnTHCVWZDIt0HQbTJ5dN3b0ekrXhrXHnMm+WGr0uu2P+lFvREM+iJNK1uq2/AtApTMC9
	kdce76rmvyDbA8DreOGe2pzf+83L52GBPTVFeuOcn6pmnTxWNlZoaWitrF5jGIuT2K2CWQ5m+l+
	fcOvcTr94m2y/U28Ec85PFsf+U1KPUr7cDUkuuaaKg5ZHDfm259ty4GVnjOKH5pRuzTbGrIDmkE
	PYUjPyuWB22Bs/Q5c89HNLFgPDjyB+n7R7c9M1mjz1EJOxNHaGtt1qDxG5YCpQ==
X-Google-Smtp-Source: AGHT+IFV7ath41Z2eEX5xWp8myyzeoBzOnPw7Ec8aWL3qv3ukG4ik7ICren+k5mAPFXPougQ9dJ1lQ==
X-Received: by 2002:a17:902:f64c:b0:234:d10d:9f9f with SMTP id d9443c01a7336-23ddb30e308mr13855485ad.40.1752028750055;
        Tue, 08 Jul 2025 19:39:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434f06fsm125798655ad.87.2025.07.08.19.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:39:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 4C012410194B; Wed, 09 Jul 2025 09:39:07 +0700 (WIB)
Date: Wed, 9 Jul 2025 09:39:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
Message-ID: <aG3WS3pEsJsZVbOF@archie.me>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-3-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BP0hOY7hk3PGD1j7"
Content-Disposition: inline
In-Reply-To: <20250704190724.1159416-3-andrealmeid@igalia.com>


--BP0hOY7hk3PGD1j7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 04:07:24PM -0300, Andr=C3=A9 Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
=20
--=20
An old man doll... just what I always wanted! - Clara

--BP0hOY7hk3PGD1j7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG3WSwAKCRD2uYlJVVFO
o9jIAP0d1DLbaozD7zuUrBvyw1KGHqGkDsCNoDIDdihdmWcChwD/dY1+06nHTlr2
5HGf/WRMm48Oz8YYzpiq9c8wFT7zpQE=
=qpdP
-----END PGP SIGNATURE-----

--BP0hOY7hk3PGD1j7--

