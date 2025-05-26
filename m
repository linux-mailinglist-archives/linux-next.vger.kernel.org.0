Return-Path: <linux-next+bounces-6933-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A15AC3D81
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 11:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E6E17320E
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 09:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9AB1F417F;
	Mon, 26 May 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="c9+ups1O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C221F3B87
	for <linux-next@vger.kernel.org>; Mon, 26 May 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253547; cv=none; b=JAJnPN8FjVWK2oQkZ0uoUIq279/+6k796UDOHJzzcjloD/s5JlfRSKgV+vLv6i1vaTNJm2HzkjkJIYaOrO94VI0S/recyzdnSiHs0FE0U56pzxc95/pwHph9nU7/RjXzgE9GnjwpGyUMNYC87McLFjm3JdSQzDn0L5jPaONuEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253547; c=relaxed/simple;
	bh=ZZ/CN1r4rWAqXttKLcXuv5t0jn+s5tjiKYxppOvqz0o=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=CQc0H7ZDmuhGMX06FGdOpcywMwpwRot0PKM5QeuSsEnbJGrzs3OxSAR6fx/rpXUhUlhGjOAFBfo2Kljhryy4Zna5Ur3khEFF76YzvecF1/O/g42cMf91xAlYR8Q282WKY+oTpCEiwrbEr1ibMzwIsoKMtvR9L0a8PX0WOBbpBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=c9+ups1O; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7db5c1312fso410181276.3
        for <linux-next@vger.kernel.org>; Mon, 26 May 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1748253545; x=1748858345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bAscapsNbBNCEyNcI/o/geJmdjtYZcfwIFLzTWKZcI=;
        b=c9+ups1OgA79qK5AGoCSAHrdBYkGTzplzUk2iaScgdB0XzsHsTms+4HzXVm4c3I5mv
         UnwjdHYejtlMI7MXwgt0qCrcAaQqPSvaRMvNH7VMYALY6kob0rvyK4HRxy4XZSGI0dL9
         NlXTg5NmIGkIXWsQHTC39kk+M6yabncBJGbQMfj14NbP3Plh6O4ymMcLpn3Xc0PNhmYz
         XeaUhxtHTHG8EsRUEqhnJqCn4jE5DRLnx2SrQb1KB0kxhun4wD2l7mycXpdoBkawjjFd
         8yfXaMFliHAhjGfCIwrLQOtmzWpVx3ikUtjTsSW0qeRW6mrJDvpJm0C3bEQWQT1BM5wN
         8rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253545; x=1748858345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bAscapsNbBNCEyNcI/o/geJmdjtYZcfwIFLzTWKZcI=;
        b=Q0bSoCHJIieo8sDNq/ION5LAgYVoOfzsMK8wGSlOJnznTZTAn7p3ZqgRvCwcLSd5+o
         OVKJHJPa7vlKyy//Kh7kcoob/ncZ8IMLRMDCvF7N7JB9J/o/m5UYzkNkJkLR7qOFtLRp
         RBV+7NEpcXzYBncRLpsx6/3r23GW7GktbSx1ocqyYqc2Y6mrxm2ool6nCLO+63xa9+KW
         pwHQtsy3nFqILxKY2Ond2VUTNbwR1c8c4MWRCu+a+lEFCFl2RPoT1ma0VRGnVwuJrYk0
         /2AnfwRYn/Hwr792K3TU6P9BywLfu1s7pRoLGWJ1swLY9pFiHfeL5hRS69HIevLNmXOr
         QgNg==
X-Forwarded-Encrypted: i=1; AJvYcCUO2Z2glHUNHDUsEVjW6zOxCzUbxQT8/VWXQXrKYJUp4iioYqdIdBSkGXjp7dy2sKVzqucb8JUft8+a@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRpMgg1dALSFZisYH/MHsbS7bV9apYomDi5oAXc05XmN0yugJ
	6e9tufSEt5beqjEebZEE4fqQUsnQptVVXL+U7eFaRrhyBjQ931jGWBk1WolARVPLh1UuHNb0Go3
	o3qgEnCRVwDQGFrPoxU2VI2jdsN8+Tl73EOiWycBoX9SFHkpMB5hA
X-Gm-Gg: ASbGnct9g4CGXtPuVtyclL1CFsXlyC+G722wiKVPBLbdP/T+XSHNNDd1soL+MGex4qm
	uEdjqnwGFUPmIQhBB3O0oBhxjqgeI9ITGNqAQrDbenO59S0s6ujr9cA/1h9cl4bs0EsDu8/PQP0
	ZRrNTXHJ1QENBRTaIz7DVasb5sdsvsRg5T68pqBskZVg==
X-Google-Smtp-Source: AGHT+IEMjPBNr4q4e27dnoT3RGsiVPzuztek0nqMGU5Et5iFG0oUJ2rP+NGouepqm0xXekK3Rg0A5Nm5YqgJ+VC89+8=
X-Received: by 2002:a05:6902:2206:b0:e7d:585e:8d2e with SMTP id
 3f1490d57ef6-e7d919e6771mr9152597276.29.1748253545002; Mon, 26 May 2025
 02:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 May 2025 05:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 May 2025 05:59:03 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 26 May 2025 05:59:03 -0400
X-Gm-Features: AX0GCFthZfks8QA8KnfGHvfP_2Y2hwfXyqhTrnXPwSVcO8ZIKUa3W4g8T0SOUxQ
Message-ID: <CACo-S-3U1=Q61L1TGb-KtG=cu2LNkWJC-9rBT_aNQNJQ8j=trw@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmFNPQ0tfQ09SRURVTVA=?=
	=?UTF-8?B?4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtLi4u?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98SOCK_COREDUMP=E2=80=99 undeclared (first use in this function); d=
id you mean
=E2=80=98SOCK_RDM=E2=80=99? in net/unix/af_unix.o (net/unix/af_unix.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:1ec0ababeee988e6d6392eedfbe6a=
035ed2dfd6d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  3be1a7a31fbda82f3604b6c31e4f390110de1b46


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
net/unix/af_unix.c:1158:21: error: =E2=80=98SOCK_COREDUMP=E2=80=99 undeclar=
ed (first
use in this function); did you mean =E2=80=98SOCK_RDM=E2=80=99?
 1158 |         if (flags & SOCK_COREDUMP) {
      |                     ^~~~~~~~~~~~~
      |                     SOCK_RDM
net/unix/af_unix.c:1158:21: note: each undeclared identifier is
reported only once for each function it appears in

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68342eeefb37369f44a86dc3


#kernelci issue maestro:1ec0ababeee988e6d6392eedfbe6a035ed2dfd6d

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

