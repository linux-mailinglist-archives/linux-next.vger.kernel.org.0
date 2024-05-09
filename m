Return-Path: <linux-next+bounces-2239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D08C0900
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 03:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88BC7282DAF
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 01:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1422BB12;
	Thu,  9 May 2024 01:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tyv93Y1y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9092145BF0
	for <linux-next@vger.kernel.org>; Thu,  9 May 2024 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217449; cv=none; b=cAsMn03PWyGEM3I9uzi1koIeNDjRxTworCnyrxv6LHwlWZKY6ubO+JSSYD5olfs4AR+GioENzIsDpWeYRJ17xDyZxP1vSDm1yNLAVA29ukHkt43K96tBlD4wB+WTr0JWipM6TPILIAq63vBmHqRwDEMIN4ZbYKQpuvtg2aydceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217449; c=relaxed/simple;
	bh=Vn/FlcWA6OG4zn50UWZrP5Q0IQS/pcplR6g4NLIdTLc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gQrgZcS1RLPx/Jsb9JQNbie9wlJtTQECa6nbJBc2wByiTZ1Z0uH1/gtu0MMtG39OMd6dI0q2RhLcXG8AHqajVp7LzI+xMLobwh3bSv013SMCS7VXb7THR0QHKwFmhBVIiNYHgR9S6S090L6bHJV5Uhip9ZpuZcvgQUXmfDFfzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tyv93Y1y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso382282b3a.3
        for <linux-next@vger.kernel.org>; Wed, 08 May 2024 18:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715217446; x=1715822246; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn/FlcWA6OG4zn50UWZrP5Q0IQS/pcplR6g4NLIdTLc=;
        b=tyv93Y1y0Hs+4RndAKx0PdfNcV7tTlYYdUCyw+3aplAjlIzJ+i0257OnlIheF+TILR
         4I7LoYHVLSbDuAFYcNEqyPDJArsm8hrqMsAX+mxgNzL193ZjBxyZxAP/QTFc9Xb3Ffr3
         3Fko/knPBhRRd+cuqq5vB49Ec/UItuqINlKQS9V4rn2jHUyMV6K9cTLaHQgugtDZNxxz
         y+C4zIz7sO1agXcQlU8glYG1IXVdtBzzUWqh1DIG+/S6xCxXkBu2kbCulchaqgO5C5Ym
         1Hky0bbpe+kGu/4AcnicLL58TZCGtvhmo7gEUR/5Mzn2+90/GVLaYR55tIO6m/ITt4Ud
         HD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715217446; x=1715822246;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vn/FlcWA6OG4zn50UWZrP5Q0IQS/pcplR6g4NLIdTLc=;
        b=EhfMrkXo0CZQ0cVNtdOsepzgd2usAqt3iz0c5ZUhMR2rdwFokt5MSmgrZLWHVMjdE3
         Rcf2DLxhpBeT9HsGiKdxhftI55aBZ9O6AYyk1HxXlA+oSPyAIDWcmTaMXaVXYIwCZcec
         PjAY+Te8EKlimvYKGkA+GCksC1EzlvqNnYQBrPy6n0LLjGfQoCTOqT+vyuGQI733gWPN
         dT0y2Ztf68Olb8fuQpE63VB4mZqvkdwdD/S8foDrbdfV/QC9T0HSKxCTqNls3bXiwqxp
         ZOq5NrK5LLc3HE41BfDpCz1ETM66126qFmTSNsCL56HFsKyvbwgoujL4nPwyFbcA+oX8
         z15w==
X-Gm-Message-State: AOJu0Yy+J5+wh6SFVV2nRbHgHgl/1+pJxdz/nRjKllZFegcxaohqBW+9
	1Qsxp37tH0VHC12H5FDFECwjlg4VLa/PuOZXEGJa2X1jeG9vKLK0P8EiF5SfHpXJGcFIGYi44Ak
	T
X-Google-Smtp-Source: AGHT+IF59sMJhGDZSF2RFveidLf44BGmSPwU7h99m3grcLgNUsHbN8mjnMzfma03D/2uzGkfwLQaJA==
X-Received: by 2002:a05:6a20:9691:b0:1af:a5b1:2901 with SMTP id adf61e73a8af0-1afc8d1ab8bmr4131554637.4.1715217445978;
        Wed, 08 May 2024 18:17:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c036272sm1734235ad.188.2024.05.08.18.17.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:17:25 -0700 (PDT)
Message-ID: <663c2425.170a0220.7a70.0d87@mx.google.com>
Date: Wed, 08 May 2024 18:17:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.9-rc7-177-ge84b53c411b5
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 1 build: 0 failed,
 1 passed (v6.9-rc7-177-ge84b53c411b5)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 1 build: 0 failed, 1 passed (v6.9-rc7-177-ge84b53=
c411b5)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.9-rc7-177-ge84b53c411b5/

Tree: next
Branch: pending-fixes
Git Describe: v6.9-rc7-177-ge84b53c411b5
Git Commit: e84b53c411b51bc97acac760c3624d626e5a05a9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 1 unique architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---
For more info write to <info@kernelci.org>

