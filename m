Return-Path: <linux-next+bounces-7408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2093AFC9F4
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D81188D21B
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE7E284B5B;
	Tue,  8 Jul 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sZEdIwJp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F8022ACF3
	for <linux-next@vger.kernel.org>; Tue,  8 Jul 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975948; cv=none; b=pWclVUv7sePTiVwcunBQ8zzCXWvC4gGir8b9yU+MkHktWIDcox1bL2Jvjl1Z2Wx1aPbuFVV839kKAN04qXktBE+wOqbmbdR2+AaXXGv48bUtW8UJ3FQTp5m1fmxLAVLr6DZ8htMdAwloZ1KVTXL1V2nEjCjZl5PS+nnX5mbgmTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975948; c=relaxed/simple;
	bh=L2kk/Y50TQGvVvlwNBwHcYOeOmCnkOn1jHt2wqQjjiU=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=UdwUyDYdUJoKSzA10YhyWy2mjixQBQLRWeEFBLEKao0MszfsWpWGM1hbRABQy/ULfAKFqBNLUsj0UNZvgr0/oX/yq9FSUKTCEcwd7kzw2TwZMtv+v5Mn0a26mRgRnzC1TeaKjH2aPb/rsfiQmibYshj2SMRqCA8Iyg7Bex64/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sZEdIwJp; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-710fe491842so29541367b3.0
        for <linux-next@vger.kernel.org>; Tue, 08 Jul 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751975946; x=1752580746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=itTve5oaCyFz6zqdqEqDpECcZdI9RhkR/BeCO9Yg03M=;
        b=sZEdIwJpUM6Y/qkm9PJaCC9Sy+TSBqRvn29A0iY8y3wb+b+1k/oZtUvRZVZCpyvgOn
         NooGnzEzVuuF++VqREfPY4nNRjNOeURiqW6GTkK4Iua9WYIx8mZ92Xrgt9YYo4rnY6mF
         FQsj0vHrl6iBQr4zpDcvyyfB6bcNl15lyM3uhF9AgF3QB7iVomEKkk2raIquSdMafC1q
         G2AJ0GOcLq3Jy9fnD0v/51VmWsBbVkSXxCUxtVre7q4YO87LCZZdwbEM+khNJFDGGvGp
         jki6i1k2gOlD7QBp4pHOq0TbLf4CAjeOhmN5gLguUg+1vIhIjuV1mM88J5TOLEIaDM6l
         cIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751975946; x=1752580746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itTve5oaCyFz6zqdqEqDpECcZdI9RhkR/BeCO9Yg03M=;
        b=xAlZhJdX3aFUSSjRzXPF3jDYi03L5/tyRMgeI75JA0CK2bozn/A745wJBvMB+B1Wls
         eXBMH3xF/Ks/C7wn0DYZvTtLEXHmDsBkYnFGNyoRUrvP/uHolLN3gFYb4kQPrMeS63ru
         cBXdAvKhyWxfqomU/Ur57r6g5sKlgCrG6DbXcg5a9xzgFbXyQRbLFSn92i0Df657K4Z+
         pmbBc0DV2h52ZX54kVT9VnDwcoh0U6deg1xnOZGZuxIhZyrRgyRaRQ3ZyvfwWWTnd5ak
         BzgoXwb45QfTzlpNNJfufjNSwH24eg6lIUaPPa1vMoeAUfRp+bzHXU4pMEI+bX/paYkD
         NY5A==
X-Forwarded-Encrypted: i=1; AJvYcCWizQJv/8h8917vHD932OT4BvBgYYrT79xPC7FWiwbdIEUEkZNDfdhW6fd7C3ITQl/hRVkwIBeq4FF5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/DTkRXY989/ORCgJQchzFKqly9c4n8Mp0O/mBpSCIJsNSpCi
	05s2bvG47QRDHzVEEJdC5p+G2DOmvsNKt29o56c/fZMEBJ6V3FApEy7AuLai/f9EafHV0HhJmZa
	iz3moAp4i3dAJ2P5cqknXLtFIvygzUt8eu/NfwIiQ7Q==
X-Gm-Gg: ASbGncvGPD1oiq6m6hEZuykwQ96oEhoCSljQV3GnNzFfYHqt6jquUnUBJ6o2fdghLg/
	eNCrZRE4TpnYxWGjv3smW6C+dZbWbbAsw6NMib+ODiEKYCAjv7eRknnMcbX0oYbIk/5dgPNQfJx
	rsg4m0Kj5/J8Tpdr3o6ZQpmP1fjrlwcoPoLd1FdJ/D6g==
X-Google-Smtp-Source: AGHT+IEcYuwWugFSk8BbEt3kvM/tcewci3Uxixw5z4wz2ahT+N1YSv8Y0nwJmVXjo8ArBo0Frjk47hX4gsbSRPOwnaQ=
X-Received: by 2002:a05:690c:9b0e:b0:716:4e16:4494 with SMTP id
 00721157ae682-717a0403abdmr34042437b3.20.1751975945855; Tue, 08 Jul 2025
 04:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:04 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:04 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 8 Jul 2025 04:59:04 -0700
X-Gm-Features: Ac12FXzQf85I7ySs1jjo3fwnQ21tGgy5H21viXt0JfbJVMgIc-A5vSibed-yOM0
Message-ID: <CACo-S-29Degjym-azsJNSd1yofLOB2_Rf5xpa9b7L-14OPn7wQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGZvcm1hdCDigJglbGTigJkgZQ==?=
	=?UTF-8?B?eHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYbG9uZyBpbnTigJksIGJ1dCBhcmd1bWVudCAyIGguLi4=?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 format =E2=80=98%ld=E2=80=99 expects argument of type =E2=80=98long int=E2=
=80=99, but argument 2 has
type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=
=3Dformat=3D] in
drivers/platform/x86/intel/pmt/discovery.o
(drivers/platform/x86/intel/pmt/discovery.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8fa7949e2280282be6a5756d890d8=
a9cc1472e21
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  58ba80c4740212c29a1cf9b48f588e60a7612209


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
drivers/platform/x86/intel/pmt/discovery.c:427:35: error: format =E2=80=98%=
ld=E2=80=99
expects argument of type =E2=80=98long int=E2=80=99, but argument 2 has typ=
e =E2=80=98size_t=E2=80=99
{aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~
      |                                                               |
      |
size_t {aka unsigned int}
./include/asm-generic/bug.h:112:31: note: in definition of macro =E2=80=98_=
_WARN_printf=E2=80=99
  112 |                 __warn_printk(arg);
         \
      |                               ^~~
drivers/platform/x86/intel/pmt/discovery.c:427:13: note: in expansion
of macro =E2=80=98WARN=E2=80=99
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |             ^~~~
drivers/platform/x86/intel/pmt/discovery.c:427:53: note: format string
is defined here
  427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
size, &res_size))
      |                                                   ~~^
      |                                                     |
      |                                                     long int
      |                                                   %d
  CC [M]  drivers/platform/chrome/wilco_ec/telemetry.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686cf98934612746bbb465bb


#kernelci issue maestro:8fa7949e2280282be6a5756d890d8a9cc1472e21

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

