Return-Path: <linux-next+bounces-7460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF10AFFE9C
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 11:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05AB77A1A82
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E412D4B41;
	Thu, 10 Jul 2025 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wjEiWl6c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8C1EF39F
	for <linux-next@vger.kernel.org>; Thu, 10 Jul 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141548; cv=none; b=W2kREnI3Ut4/y8Ai+UOJ+g2fL1EFDGVYaY1IUBgYbVpBfsSvksLQDI88o0Z7rzjEpMSRyoYmSVSKj/haDv7UUjOHlMwzaqcsXw8yslvyB5QiMCzca7v4s5BWXluQ+7Tc8TJYiWvPs6aiwRBuotCANkrF7l3LhfOqhGsPiZkXoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141548; c=relaxed/simple;
	bh=6yv5CFJYg6pTTof2JcjC8om6Vi1/YsgX1I/zy2a1V3o=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=WFGP5C0H70HGzIXnBQp4qirCoP4fhxRuMOdG5qNYbHgzv/X3Thv9P3xtSdDytx0uJFb6O9TPJrimocIBpazXwjzyFWw+C0PVq3uCxPLf4en3aKOhhYsckRORTJs/1AV/oadQy0M6IkL8om3Fs0iWf+GXzg0Osl4rzFnw0iY5w/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wjEiWl6c; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8259b783f6so607484276.3
        for <linux-next@vger.kernel.org>; Thu, 10 Jul 2025 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1752141545; x=1752746345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tfPYL34FapnC4GPOI5oKk+QzBPVtKMCrzZZzT6Z9TGs=;
        b=wjEiWl6crLkT+l0KUuBuL4TS8Lr+JeziceV7QUCmgev/2IKOwVzBQKJ39f/p7pUTua
         Rps2ao+qo2eY/zkFtdX0yik/aF66sy+YOwxObBf5VOSb+CF4Y6siBuR6e2h9VoJ6H7lb
         7wZWFy2+7sJ5iyo08YoG2pjU0EaXjBJYR3iq92ieKK6aNZ0U6RsA/2FuZZG5j2lDmIzb
         /YJZDtdl0yE2Lks/u7VoL+njhLOs4ZS8YC52TarkWcDJO7a7aNHHBGv0xxo5JpyearqY
         S7uK8bomDfMtaCkkdwLhG5265mkQYmgL5VPvSWsC5+rQAmBIS1K2DLCGp5WVkH8SZijD
         0ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752141545; x=1752746345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfPYL34FapnC4GPOI5oKk+QzBPVtKMCrzZZzT6Z9TGs=;
        b=Sh8C7Y1G+kNImJYLMrYJLheJ+8Fm/ZJgTU3O8IpzNoIKgX5kHUgFYNyHkBGgl4yn1a
         pKpvdicGidyjjyPPyxSVhUNqNfbFQQ1qoTNEAY1nC5iYASrhEvovefirDpEnj40NGG6e
         OaEcv/HjoXMrko8TvYPIk9arJnpxzKMMqER2p/e10Nj87AYgYTwbjuEFStotN9OHm2O+
         qOorDaLDYs7IHhGthrptf3NoAdWuyVVeuJXO+9d7jke5FcynJxwV66WKEkPx3ARfLtYL
         gy3UgorzSYNgF54hJpOtCzYyvzVCo6ISKibPqbQ7T9RlgvUKc47Fy2trvnibPuzEsT36
         oYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBjanetrWogx6Qv1aahc/AUsnZ0oZjZ/xulAp/yjLuEXEYbWyvHMiiHELL9sVhotpKZ1R1sCc9ynu1@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsNp8tKnKTrWGm9EdCQnptgzMFL4CZ/7naNctK3BcXHLzcqDM
	+yKk/siQovCwRzq73pr+TDEVnNPVdoWlgDDJyzZ4YXM5urAnZ1INzaeloqfePVlE5HY3B3mynuH
	LB47b7yUKs4UTNh9HkimGImYbxzRQOQoqnwkPkqYIog==
X-Gm-Gg: ASbGnctn55qer5G+3ONXfr8bw+OuuKSYufAI17q0h0OM/C5y1etxGkTJcdIj5ggerAl
	dPGojYZKeY3w7q2KafC3f/ktFHupKW0UTcw8YFAcUJSJEfzD8OvIad07E3T/U0LfTz8aQUY68xJ
	HfhZagBiU+ylpkucXTp7cQ9pyJkGG1VZ46auD43hovdg==
X-Google-Smtp-Source: AGHT+IEvnVOnHYxR6L/U9hATW8VlP/nRreoqxAWBxTJdckQ8TG2I2oMFRHXWKaTXYa0HCcEiTEz1z7+6bQnQfU+whgM=
X-Received: by 2002:a05:6902:1b8f:b0:e87:9bb7:beac with SMTP id
 3f1490d57ef6-e8b7a32b090mr2099503276.15.1752141545488; Thu, 10 Jul 2025
 02:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Jul 2025 02:59:03 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Jul 2025 02:59:03 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Thu, 10 Jul 2025 02:59:03 -0700
X-Gm-Features: Ac12FXwKSGRsI8--21ZXA6ao9GKzE5Y-Pb9yoM_YMb3xR8GzxcScAmYZhY7fekQ
Message-ID: <CACo-S-0z4uY0xuN_fxBkFy2HtH19LtPWD8FkWEFsCVpMGPHGjA@mail.gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION=5D_next=2Fmaster=3A_=28build=29_ignoring_return_va?=
	=?UTF-8?Q?lue_of_=E2=80=98u64=5Freplace=5Fbits=E2=80=99_declared_with_attribut=2E=2E=2E?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 ignoring return value of =E2=80=98u64_replace_bits=E2=80=99 declared with =
attribute
=E2=80=98warn_unused_result=E2=80=99 [-Werror=3Dunused-result] in
arch/arm64/kvm/sys_regs.o (arch/arm64/kvm/sys_regs.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:a2914456a7f9a96dd6b9a22a0784d=
af92bd464f3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  b551c4e2a98a177a06148cf16505643cd2108386
- tags: next-20250710


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
arch/arm64/kvm/sys_regs.c:2654:17: error: ignoring return value of
=E2=80=98u64_replace_bits=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99
[-Werror=3Dunused-result]
 2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      fs/nfs/nfstrace.o
  CC      fs/nfs/export.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/soc/qcom/ubwc_config.o
  CC      lib/bsearch.o
  CC      kernel/bpf/token.o
  CC      net/netfilter/xt_CLASSIFY.o
  CC      lib/find_bit.o
  CC      lib/llist.o
  CC      kernel/trace/trace_functions.o
  CC      net/ethtool/pause.o
  CC      mm/mmu_notifier.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686f7f5234612746bbbdc9f7

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686f7f5434612746bbbdc9fa


#kernelci issue maestro:a2914456a7f9a96dd6b9a22a0784daf92bd464f3

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

