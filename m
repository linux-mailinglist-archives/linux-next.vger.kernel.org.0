Return-Path: <linux-next+bounces-7568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F77B06DBA
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 08:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4579A56700C
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 06:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2228506E;
	Wed, 16 Jul 2025 06:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4k6Kl1g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E74E27281D;
	Wed, 16 Jul 2025 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646343; cv=none; b=dlDprX2sOpAYKHPWbrpiCamosUt1zlnIrw+duIpYV/9olOskbwHbK3cJWiQQoR+9FNzv65C4+MQSWdJgZ4BN2aqQ4f67RyZobF9ck5Nhg6fBOp5fXtyt05F/vmS8ORO2EECKIo56qT5lmapRdzYNMyMHAHFN1m0dEPncMqX97zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646343; c=relaxed/simple;
	bh=HfCdH20H8XEktj4hAhAZf4tHc1mOpanXTIyxComBIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkSeBCJxRdi2vuH/je8Nx1Ihz+jXBYzvkFVEN06hlu4uu/5BBLhgSddwvykFj+69Rr5U6WZpNXeXNY97NDAj2WcrmuBPThB1lkXxUoQKpXtjdPDs/1XhvF5rCvTypsWH6fRL+rHRZ1wUCCdjEg++Pspz4H9dwDp1MwzwcOawPwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4k6Kl1g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so56668545e9.1;
        Tue, 15 Jul 2025 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752646339; x=1753251139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GlP4ZdeKShV5rQiJyCVImTY0UBQ/w6pCG8WMaO+DzPo=;
        b=F4k6Kl1gZFOA6L3Dm1u44NDiZxpMMNN9PpGnACRFRj3rAhhGLZ4rb8Py1RAHJEfZOn
         Nh3565nxdhGQkJX4T2QJnmA1Ws4ENy591c9NqErkoKHCYZfQkiU9oHjiPlX4IMoFUw+7
         GHzDbDsJvRQZ1qm1PsWNvAGXhJlld57BPlbh5T9bfoO5jNzOqQAVhuNxJjHQgq5f8t9H
         RDXAkPypgFw4zbE3VINdPZ2RVaR6WDXFLewOUUCTqceQRX5ANuD/544YPsbfOgrOJJV1
         jjBerTYJGB7Qz8pk9ng4/HywWXKDV0p6zvlpX0nOi/LtBH6GVWyvEe5f1BkhmKHonc5E
         Xz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752646339; x=1753251139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlP4ZdeKShV5rQiJyCVImTY0UBQ/w6pCG8WMaO+DzPo=;
        b=bnCLn+1cqvQ2E6Yd7nG0aA1Bb+qx2HZRZBV7M8OImPJoK59hAjd4LMk92wC94UeH1a
         +zh6A+44sGSWkDe8N1mZBUd8AyZ1K+Uy+UxuUzdW/w1Y5l4N0KPB7yj4oJwee88zoKwU
         m1fTOMOC9HfeMU7ajMtTvPnsofXlsYyLoQDkMW3/lXj1ZowWeNU9j7NudLGr39x18T/q
         +aQRNoE835ESfIg8XkVb1jt9Q3xB8++qeVA8gh215NrNmS1M38yZ4mTbcbv6cDkGIynz
         9LnhxWmHyBsHiS2OlYPReDqvZj4ylE8IygP5IE9vFBxVjYAlhwQgOewbGSOFKqQhCY8R
         tGjw==
X-Forwarded-Encrypted: i=1; AJvYcCV/YJ/XwLUVe9yGmgdpVSzbGArqzgujBnnZ62VF2OAizPUVwv2RzIUAxYMP0dgUiZYNzobCR3uXK+PG@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/D0foHuwWS8UTFdgagHyOWsd5/MduUKhNzpXAsrX7utKLeFT
	AkRDuN9166hHFaeP+anSlBIOIaNqk38xX4vFC2uPfZ6xu+pY2He8MAZx
X-Gm-Gg: ASbGncuxw50CTCFpjhrp1vEe7LA6jFM+C93YI9jL/3NNNNrQgM5VkrQIq9GldQ22kgU
	LjxhR1DNnKbhKPlUVXicRDiMHjbxjFiRFHiDJEX1SKzuVeAN7YhCA4CRcM/Ma8TgODHYrdQwE7K
	5RfjfTXdUKCLfv0H0QwtrKBM2K4EQUXSEyPsuhIdgb8qPDz++i2XJTDkiFWYOgqJ1kwSYL0j/Lk
	1FT0nwjKN2mghM2tTokqMnJ/7AYZyqc2zRLGgBbxEsEPXW8AJ7bq2PlUEYm63ZM/CscGg6NaZzi
	blk8hgdYbw+JdQrC7E9IrB2oS1/aaGTk8lUso05IcKkdPO7qN8h7X9nKHMRqpHoZTi72SmiLRd+
	WAQLAvgAdgaRVOT3nMIH5jg==
X-Google-Smtp-Source: AGHT+IGkdl3BRlG5qAc5ojtwjIgjKfhY9MXsw8sDfXyJn213eW1Ghqc5/3NmdaYGT7qHfDqoC/8WwQ==
X-Received: by 2002:a05:600c:4fc1:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-4562e37a11emr13388785e9.2.1752646338419;
        Tue, 15 Jul 2025 23:12:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2f1bsm10526245e9.4.2025.07.15.23.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:12:16 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3F1AC4208F51; Wed, 16 Jul 2025 13:12:10 +0700 (WIB)
Date: Wed, 16 Jul 2025 13:12:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the jc_docs tree
Message-ID: <aHdCuWhR23EQPXJ2@archie.me>
References: <20250716150234.52ec0d5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VoSKXlirJEnGGQs8"
Content-Disposition: inline
In-Reply-To: <20250716150234.52ec0d5f@canb.auug.org.au>


--VoSKXlirJEnGGQs8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 03:02:34PM +1000, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> <snipped>...
> diff --cc Documentation/userspace-api/ioctl/ioctl-number.rst
> index 677456c31228,4f1532a251d2..000000000000
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@@ -223,32 -219,31 +223,31 @@@ Code  Seq#    Include Fil
>                fs/xfs/linux-2.6/xfs_ioctl32.h,
>                include/linux/falloc.h,
>                linux/fs.h,
>  -'X'   all    fs/ocfs2/ocfs_fs.h                                      co=
nflict!
>  +'X'   all    fs/ocfs2/ocfs_fs.h                                        =
conflict!
> - 'X'   01     linux/pktcdvd.h                                           =
conflict!
>   'Z'   14-15  drivers/message/fusion/mptctl.h
>  -'['   00-3F  linux/usb/tmc.h                                         US=
B Test and Measurement Devices
>  -                                                                     <m=
ailto:gregkh@linuxfoundation.org>
>  -'a'   all    linux/atm*.h, linux/sonet.h                             AT=
M on linux
>  -                                                                     <h=
ttp://lrcwww.epfl.ch/>
>  -'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          co=
nflict! qat driver
>  -'b'   00-FF                                                          co=
nflict! bit3 vme host bridge
>  -                                                                     <m=
ailto:natalia@nikhefk.nikhef.nl>
>  -'b'   00-0F  linux/dma-buf.h                                         co=
nflict!
>  -'c'   00-7F  linux/comstats.h                                        co=
nflict!
>  -'c'   00-7F  linux/coda.h                                            co=
nflict!
>  -'c'   00-1F  linux/chio.h                                            co=
nflict!
>  -'c'   80-9F  arch/s390/include/asm/chsc.h                            co=
nflict!
>  +'['   00-3F  linux/usb/tmc.h                                           =
USB Test and Measurement Devices
>  +                                                                       =
<mailto:gregkh@linuxfoundation.org>
>  +'a'   all    linux/atm*.h, linux/sonet.h                               =
ATM on linux
>  +                                                                       =
<http://lrcwww.epfl.ch/>
>  +'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            =
conflict! qat driver
>  +'b'   00-FF                                                            =
conflict! bit3 vme host bridge
>  +                                                                       =
<mailto:natalia@nikhefk.nikhef.nl>
>  +'b'   00-0F  linux/dma-buf.h                                           =
conflict!
>  +'c'   00-7F  linux/comstats.h                                          =
conflict!
>  +'c'   00-7F  linux/coda.h                                              =
conflict!
>  +'c'   00-1F  linux/chio.h                                              =
conflict!
>  +'c'   80-9F  arch/s390/include/asm/chsc.h                              =
conflict!
>   'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
>  -'d'   00-FF  linux/char/drm/drm.h                                    co=
nflict!
>  -'d'   02-40  pcmcia/ds.h                                             co=
nflict!
>  +'d'   00-FF  linux/char/drm/drm.h                                      =
conflict!
>  +'d'   02-40  pcmcia/ds.h                                               =
conflict!
>   'd'   F0-FF  linux/digi1.h
>  -'e'   all    linux/digi1.h                                           co=
nflict!
>  -'f'   00-1F  linux/ext2_fs.h                                         co=
nflict!
>  -'f'   00-1F  linux/ext3_fs.h                                         co=
nflict!
>  -'f'   00-0F  fs/jfs/jfs_dinode.h                                     co=
nflict!
>  -'f'   00-0F  fs/ext4/ext4.h                                          co=
nflict!
>  -'f'   00-0F  linux/fs.h                                              co=
nflict!
>  -'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     co=
nflict!
>  +'e'   all    linux/digi1.h                                             =
conflict!
>  +'f'   00-1F  linux/ext2_fs.h                                           =
conflict!
>  +'f'   00-1F  linux/ext3_fs.h                                           =
conflict!
>  +'f'   00-0F  fs/jfs/jfs_dinode.h                                       =
conflict!
>  +'f'   00-0F  fs/ext4/ext4.h                                            =
conflict!
>  +'f'   00-0F  linux/fs.h                                                =
conflict!
>  +'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       =
conflict!
>   'f'   13-27  linux/fscrypt.h
>   'f'   81-8F  linux/fsverity.h
>   'g'   00-0F  linux/usb/gadgetfs.h

The resolution looks good, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--VoSKXlirJEnGGQs8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaHdCtAAKCRD2uYlJVVFO
o6xrAP4rO+lMTYFI+IUTxoXVNo/+QUEoIE2Z8u01j44AKqto7AD+IBGKw9uzhwcw
dfE5rfh4SdUCJ9s6QSV1+S3a2OtvvQ8=
=IS5B
-----END PGP SIGNATURE-----

--VoSKXlirJEnGGQs8--

