Return-Path: <linux-next+bounces-3999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B8988D40
	for <lists+linux-next@lfdr.de>; Sat, 28 Sep 2024 03:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12590282CE9
	for <lists+linux-next@lfdr.de>; Sat, 28 Sep 2024 01:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D61BA3D;
	Sat, 28 Sep 2024 01:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvMeX0S+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E0C28EA;
	Sat, 28 Sep 2024 01:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727486168; cv=none; b=lxfmXvpWVuDnztOztHEWENGavgglh/xkDJDjJtRB6oFqBcyzLk/rlspOLd0lAY+zclGWNNl6bRZRJP/2gjfeGD7hsQm4KYPdJMVFjhKEd9MGTsem/5ISrIbLqk/nUfEH1yEakk64TuBN+6vfzsuLLwzvx/G83IWP/Us28FwRz0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727486168; c=relaxed/simple;
	bh=X07uvNQvv0B1WrIKvyaB24pGAOcrmypzYdWwXWzs3l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNeagPIpriz38AVxj8M0jc3bRnAiaof2AJQw4gLkdGg9Vpw1dEqZfwBhM0raWuxpl2hINRfm8o6+ZY6r8wsEtbyuo7YCeca209QyZIPbE8UbCwQmXSm16/HQO5jwoKYCoZeREGb3vNPDYk2kU2GNdBzAvE1RHBXKgENDjdeht7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvMeX0S+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20792913262so32162685ad.3;
        Fri, 27 Sep 2024 18:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727486166; x=1728090966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmenBwjo2Vbivz5a9dMMksnrytNzMFbtLIwdP8yXAPE=;
        b=SvMeX0S+M5KBTnM7EvljR4UH81no2PWa2haYTkhWU6YbBFQgnz7uRnkuQTLwrD7TdV
         z2Qc6qF8P3nXXggoPLy758QQ9OtTMOgu0DtR7wVtOJX/doJMPtDpLPd6x90fOn7RBM+l
         OCCiWoIIHets+K0UYgXkDyOTXFVCcaCVvU27+UByB8Er1zkOr1ywGPflHM1C2EMLiMiw
         8dboJf9USpSKzyHoEEIcmEQ3Nx0PcXHAa3S6TXRT7oDiYY7XIdV5F+GjcfR9Mq11j7z5
         pSzeoM4WY+H7BGcu0sfvoLwoT34afUGLQByqDxtHuybqhARZoVwZy/KKb3ah2drFzOb1
         ZmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727486166; x=1728090966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmenBwjo2Vbivz5a9dMMksnrytNzMFbtLIwdP8yXAPE=;
        b=Mc4IeCKpL/sFPWyO0A8TXBtTU/ysyWH8/z1IBQ8HNBPZoXKC5/L0h+bjJeOAw0DuAc
         Y3v73Nf3v1j0ATEapPwqZ0D2uisN6MxSYI4596iwJPNi4Kjy7ornSJ14Hi+NEkx0u+xS
         zUSLiq4/IaTNcP52Nnc9ruxeH0udQhuO/kV+WcOBD6DUM2nZu0O5QiHdkivbLLP3Cof6
         ly75xfVjCSeaSyG2qhPsSCWTqrsZ1IG5tXVlO3njei/16Dcfm7s4agE5iC8d5JforYVc
         4zKoxKMV9uS9H2sMut84TuHXRlMc3uAugo5su909vAqDEVEk5n+NPtTGbbX49233XvKI
         6uog==
X-Forwarded-Encrypted: i=1; AJvYcCUnNFc4BGBEhpqSKdl5hmb8rL7Mr5SGyXJ4ydeZwPyAZmWe93RP/MkdekRFbNlK91tLHdc+SQTiIExXWA==@vger.kernel.org, AJvYcCXCCL5K0XYAiJlOligBE67G130ZU1C8S2MVLPKLXv4yZ1+xg6noRC4BnAxIOpORKvUVV78lQNNC2P0=@vger.kernel.org, AJvYcCXrlLAX3R3yZ2Dv0L6y0bJAISIK/viRM4avAY2KINaIS7erAQQYetXgmly/ZPIaaHimOz8vxkwXvfWvtG9f@vger.kernel.org
X-Gm-Message-State: AOJu0YxADxByQy1AJWTTqF/zhBP26RbcFFbjtVOkeV7/mHQg/rr90joy
	pIe6RQNIqDidmljUaHvCm6dZaqmtFcxTeM+90ZCqWgNfww9nLqss
X-Google-Smtp-Source: AGHT+IF2XdiOwSv21FunwBwuZApRttzCK4YIV+a+BZKXgPByJl59BffjPiw4iGOEPtjD6f9+V2Tv4g==
X-Received: by 2002:a17:903:228d:b0:207:6e9:2da1 with SMTP id d9443c01a7336-20b376750a8mr81564615ad.17.1727486165641;
        Fri, 27 Sep 2024 18:16:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e51d27sm18804125ad.246.2024.09.27.18.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 18:16:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 320924601118; Sat, 28 Sep 2024 08:15:58 +0700 (WIB)
Date: Sat, 28 Sep 2024 08:15:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <ZvdYzrZ56X_OvIPr@archie.me>
References: <20240919150513.067dd727@canb.auug.org.au>
 <20240926091452.4be87000@rorschach.local.home>
 <87a5fte6mj.fsf@trenco.lwn.net>
 <20240927141137.75ecdf71@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyY6iDoOgRfOJJ52"
Content-Disposition: inline
In-Reply-To: <20240927141137.75ecdf71@gandalf.local.home>


--pyY6iDoOgRfOJJ52
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 02:11:37PM -0400, Steven Rostedt wrote:
> Like this?
>=20
> -- Steve
>=20
> diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
> index 0b300901fd75..f3d235c8438b 100644
> --- a/Documentation/trace/index.rst
> +++ b/Documentation/trace/index.rst
> @@ -5,6 +5,7 @@ Linux Tracing Technologies
>  .. toctree::
>     :maxdepth: 2
> =20
> +   debugging
>     ftrace-design
>     tracepoint-analysis
>     ftrace
>=20

Yup, that's right!

--=20
An old man doll... just what I always wanted! - Clara

--pyY6iDoOgRfOJJ52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZvdYyAAKCRD2uYlJVVFO
o7P2AQC6wxh/4R1J4ZfW4DJhfv5cwk2W6gQ274Nsb3RIQu9lsAEAvI3EPUZLSX6O
TZtclINSfKUY3S9XsV8+SeNar0AOLAk=
=0d66
-----END PGP SIGNATURE-----

--pyY6iDoOgRfOJJ52--

