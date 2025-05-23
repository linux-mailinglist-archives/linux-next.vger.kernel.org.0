Return-Path: <linux-next+bounces-6915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1275AC206E
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 12:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6E716F60A
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 10:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB35E228C92;
	Fri, 23 May 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SxD97RDx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD94B23A9B4
	for <linux-next@vger.kernel.org>; Fri, 23 May 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994347; cv=none; b=YN3OJH1gzd7j8iH/SXAZ6vQ4etHts56ZdnVR/Kb8QF9eSx3h9QqyF1BWJPg2i85AEh+PC6HcDuXTr9eltc9Hi0Es7IN2ctJfKNeD5pvaTEyEpGxJCFOJix9GYAPpBpsyKzXbft89NNlks6WlMmbwYUnAjyo4LKTd4pzCD4/CHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994347; c=relaxed/simple;
	bh=6k5sARl4egvQjB2tDiWx3blzghCZ/GspQdjLGvMSf7Q=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=kkk7jUlwM6zCsXufUxjtyDyoIThORIfDAgAcTDW/HXmqHV34BhfxNWIzDY9d1noy+h/Hc5nXVsOakbOlGbrfMkW+MFQCFq+fWNsBMxIIAACmOBu1OmvHkZjMWjUcP7KeD+TcxtvyjVT/uUUKUFEipv6eH54uEy11pFly5TksgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SxD97RDx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7d7f7151f0so498432276.0
        for <linux-next@vger.kernel.org>; Fri, 23 May 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1747994344; x=1748599144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOTT5nIGs/DAYCQr79O2D7rhlDUI6zUndiZEx00HOGo=;
        b=SxD97RDx2I6pF6UT4/Xksmg00upHfeNNXneIzXQOjr6wCiTvuvdxrQJqgZfVcKjLwW
         WRjSq6Cy1cZMIiQhgKXKUnUDQbkwj3EzZKU3RCqIHNYxjMXJE8sXhhHQNMWQUu2vNc1B
         0P5WH0DKecg7x32enhCZY8EvhUYQrrgEcvdblcdEXoi45Q3jcuKgFtIUGzVqfcPj/s7K
         WH5zCMgSXoBNKddmDDN09FFmgRkldWx0DwllUaS4SsayKr0B17K4w3nifuSklr/fTonU
         BMBKfOCI3gdHTj0pgFO5m55ZzhBCe4Ry7YZJc9BBHmaQmt4EXPuJtRkae2hbsh8wl8fa
         rN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994344; x=1748599144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOTT5nIGs/DAYCQr79O2D7rhlDUI6zUndiZEx00HOGo=;
        b=ITPF9K4+7wh9nk+bj0vVPcVYh4AE1RYlrLREyFSA4tsGOwgiNqMtlroWAXrY+C06zB
         6MbUto7ccqwYR5V0BN3F8Sg80KMJV6wBErh4Vqviks/Qb8VizWJ9TSotmQj2hU45px59
         p89ReUqYGj7Yu/1S8wGlYxibLGlqf2/pzha01JS52uH7XHa9wJdflJneBx4MGwbit3MI
         mHv/wpA7emCKW2QBDqQ+qOAWIR+p1sZslOzH4MfqkWN7AkSnsxUX7MZlZo5w1kB7JbGV
         kiogYS/eflBOtJRNVpqZ6llbkzw/WtZ0nV1RYmgsMumk/ZZ5nZULY4kvAWS/tOB362a5
         PbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSocGCAOoSoTPCKM0eivk43ZoHn9pmnJspw7/y0P320jGS83MY8RWk5rzckUhJSvvgbEli6oDrKAMT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFk0XWKtJNcrj+/Xd9O/XNbMEpeHDiGgC1gsjtLGg6iMWvJbj
	LIoPQNHNAyhcmNxSbkixyzdvEfRbovrFiwMimpmxEKDxJg1HGwsFYK1aeOKrx3Iu/HmS2jlmMT7
	c4npl5tBNCnmiRNUdfmCMl43uo9Oiok/jH7F63gXqtibrr6aWANFp
X-Gm-Gg: ASbGnctS4ao2+/qRP/0cnRrie1hQfYqAm3ohnosdLqx2ZDEbxwZsE/sDK8eM1Q6csnO
	C84b6Pfkrg0iPCjTT16dYrJwOqRms5KD2TXauzgaJHSM38/VPC1AmZi12OHoYeo0Y9BZs4Jm/e1
	72pGvHLCuhQo4j76c3ikcypVaoV79gXMk=
X-Google-Smtp-Source: AGHT+IERNywlOqsHb76ESwwDhic5zl7OM6pA2LNxMcdRkZpKWbnd4VVWvvs3aOURWYY1L3F6GKj5CxrcgvYNSS61EUY=
X-Received: by 2002:a05:6902:2b13:b0:e7d:5bcb:ff56 with SMTP id
 3f1490d57ef6-e7d5bcc003amr12419064276.36.1747994344684; Fri, 23 May 2025
 02:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 May 2025 05:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 May 2025 05:59:03 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 23 May 2025 05:59:03 -0400
X-Gm-Features: AX0GCFvh9HZekbOR2cYNZu4etliQQCix7gndUiTG9DLsThUusscz0GlaOg_ARjQ
Message-ID: <CACo-S-1w-6Qudd1KrffaNNFe+NRpfeSdqyCe=3hKx5i97GbntQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmG9uYm9hcmRfZGV2XzU3NA==?=
	=?UTF-8?B?NF9pMmNfd3JpdGVfYnl0ZeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bi4uLg==?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98onboard_dev_5744_i2c_write_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function] in drivers/usb/misc/onboard_usb_dev.o
(drivers/usb/misc/onboard_usb_dev.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:a7d500f8bc2bacd741b9ca5388289=
875fcea3bb8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  176e917e010cb7dcc605f11d2bc33f304292482b


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
drivers/usb/misc/onboard_usb_dev.c:358:12: error:
=E2=80=98onboard_dev_5744_i2c_write_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function]
  358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client
*client, u16 addr, u8 data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/misc/onboard_usb_dev.c:313:12: error:
=E2=80=98onboard_dev_5744_i2c_read_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function]
  313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client
*client, u16 addr, u8 *data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  AR      drivers/gpu/drm/panfrost/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  AR      drivers/gpu/drm/sitronix/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/gpu/drm/drm_atomic.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68303248fb37369f44a3fd8f

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6830324cfb37369f44a3fd92


#kernelci issue maestro:a7d500f8bc2bacd741b9ca5388289875fcea3bb8

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

