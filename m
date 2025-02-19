Return-Path: <linux-next+bounces-5500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10CA3B5AF
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7B817B167
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 08:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C08E1F30C3;
	Wed, 19 Feb 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlmgRuI4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4D1E8855;
	Wed, 19 Feb 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739954752; cv=none; b=MIvc+ES/+k+/Jm+N3LYDhkJZOz/fEULA6ZZuILTv79Ro9Y+8OxwEFCMMx1LoyhZPyrw8NIw9gPoaCj+7xlo6wIYCXIzI/vLFgtLDgDz/VD04A8YOvmrHxg7ATHxyjGmH59CEGey5TI/eLCbuD2cB+R4/lXRIrGDuIdD2APGqVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739954752; c=relaxed/simple;
	bh=7R1XgXvH4k6kWI4gbUxzVizRcGgBTxxEExScXUbKaIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjFj14fhHPy4gU5n56W/lmyA9CiPQV8xHB2GH3uvAU7UlND9OnrwVKhYl1tSsnj7tmQzYzPumiLRR45ZYF/DN8NaoBA7ld3HqfM+ntq6A/IrxznVA2oRQLDcLZDWX0S+ctY6L4+r0UzpteXD1e/WRfCuMRLvG5KQwP0ZRWL5gf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlmgRuI4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220bfdfb3f4so130316975ad.2;
        Wed, 19 Feb 2025 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739954746; x=1740559546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyzPIrh5uPcfgejnraHvrZOB70D7n28gMQT0mt8KoNg=;
        b=AlmgRuI4UWzUcP7eteoCRldxO3fiKuR3jfvZepb9Awi9sBeNyaGVriiqriZFtm8f/+
         f2/F0BJ806P6/s3lJc/Y/QzAz0PIrVjiySo67sAbLym9SVNdhBc7MrblJrN7tIgTtZq2
         uHf+ONC8Ln3KWp6D/iEvdrVtI8Ra1gGHDpvj2b2DxWb858YKnGL1L/+EHUZMOePoY5tk
         khW59rH1vGEUAtFXT0wWOC7TCuOcHKbmdzzVAK53AcBl/zWg7yARdcCw9uzHyay6lzCl
         g5SXqk5ZPQUQNwproPZk/zO889J0JtAS+noShuZdMcXrE8qoTc1l4r2dcDu6vQILC0Ek
         HYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954746; x=1740559546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyzPIrh5uPcfgejnraHvrZOB70D7n28gMQT0mt8KoNg=;
        b=VtKezb7XEaa13AqAmrDyaHW+s/q7QmcpYhMDm8uPL2woPlTFQU+AP8Q8tcOHY25hIP
         cZCMAHvSZuB/WVIWp/nvf+c9dQM8O9A6YmYILVxz2SjxeqZj85JXNwsJlS+XKqjak2GL
         j9FABgRByWriKdPtQqk4+VdVs2ccH+ugtsINwsoO5SVXdN5FmlIcMgj0q/Jko/hPOzmC
         INmmiyoVVvKw21KmIg2nUPwGfiwaIjAS4Mav6NRqOoYaK50wePfjlyAiFe/2M0H5n3OQ
         1UuJXIoXBLayqR9Ph1i1f6zgYSlmOIPM6kFTg+1BAt1ev647LcBewMOA5R8RyKxuM9xN
         bgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEx8kcB26hxlIEdYH4CBApnn67PzgZqJq92H99HDOuykoJa866QKFdoeuQPXp7MtjsU+BEN5bDUTTHnQ==@vger.kernel.org, AJvYcCXaPD6eKRat0Ax6yiQNLMjlXPn5HgWmjHcO4qOqbA5cE1lsKVgpRhrpv2Wola83zNL8iKeLtXSEKBfPlek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFiUcwS35AvecRrqJNDWUA8Ekqujk7wklZ1SkJwi9ApNv9DF9X
	0pfftAOS+zA6UPgNKBry96s/AHxnurWgYCkhKWEs8aktZzdap6fW
X-Gm-Gg: ASbGnctyxETFp/P34ebyK3ji8nX4PYlnk4u+pJAoZhMErKBx3OpVFVIeCAZ8Pn+IgRw
	nwq15ciyogeeJRd4Ph0cAnQx6wxDxT0aY61BMaFcMtsPyHYjK48b8PZ+jVvVlXwkP3hZrx5MUDP
	ysUFHrFLYiNpCDjujxYX3b9OwrS+PqJSXUalStcgsRoj9BtQJG6LogNJPGHii7L27dEomOQKI0g
	suyxFJCP7zEKEm+5MQ0Yacxlc7K1TLuL1gRYmTA2szdGQeXDBD4DJNfWhYwZyvlI2CbLDFW377A
	bAxV3JmgdoaDaXM=
X-Google-Smtp-Source: AGHT+IEadsqAT7HDWxhECrTjMWGYniQebpKUIG+KG1kh3Rxji0Yr4BRPTOwkOehWMk4RuFyZK58OWg==
X-Received: by 2002:a17:902:ecca:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-221709622b7mr51696985ad.19.1739954745827;
        Wed, 19 Feb 2025 00:45:45 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55908a7sm100814075ad.240.2025.02.19.00.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:45:44 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A59804208F47; Wed, 19 Feb 2025 15:45:41 +0700 (WIB)
Date: Wed, 19 Feb 2025 15:45:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>
Cc: NeilBrown <neilb@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <Z7WaNWHRkqt2rFGA@archie.me>
References: <20250219153444.0046e433@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x4wbRtB/Z/s8aFtD"
Content-Disposition: inline
In-Reply-To: <20250219153444.0046e433@canb.auug.org.au>


--x4wbRtB/Z/s8aFtD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 03:34:44PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/filesystems/porting.rst:1173: ERROR: Unexpected indentation=
=2E [docutils]
>=20
> Introduced by commit
>=20
>   20c2c1baa9ab ("VFS: add common error checks to lookup_one_qstr_excl()")
>=20

Separating the bullet list should suffice (plus s/recommend/recommended/
for consistency with the rest of docs):

---- >8 ----
diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesyst=
ems/porting.rst
index 3b6622fbd66be9..cfac50a7258db6 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1166,10 +1166,11 @@ kern_path_locked() and user_path_locked() no longer=
 return a negative
 dentry so this doesn't need to be checked.  If the name cannot be found,
 ERR_PTR(-ENOENT) is returned.
=20
-** recommend**
+** recommended**
=20
 lookup_one_qstr_excl() is changed to return errors in more cases, so
-these conditions don't require explicit checks.
+these conditions don't require explicit checks:
+
  - if LOOKUP_CREATE is NOT given, then the dentry won't be negative,
    ERR_PTR(-ENOENT) is returned instead
  - if LOOKUP_EXCL IS given, then the dentry won't be positive,

Let me know if I should send the formal patch.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--x4wbRtB/Z/s8aFtD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7WaMAAKCRD2uYlJVVFO
o7WUAQCpjVqxu4vPorEol6QTiRkibN5z05gM8EUTcxtmaA8jnQD/S576gdOuXSQZ
zAqe9RIwNg7riMbvpjeZvaqwRfCKHgQ=
=ClpC
-----END PGP SIGNATURE-----

--x4wbRtB/Z/s8aFtD--

