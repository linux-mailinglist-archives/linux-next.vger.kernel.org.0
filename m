Return-Path: <linux-next+bounces-2192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30C8BCC86
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 13:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63EC01F21F5C
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 11:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4F2142E6B;
	Mon,  6 May 2024 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz5u+8Nw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C2128372;
	Mon,  6 May 2024 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714993199; cv=none; b=Lmq7E0ceQCqt1+qejKkhqGMkOYZPCPNyO90mP1dLOiDRTkWs5ghrooFQfw0j3jPI1W+n6uOsxmSPkwO1LE8eEBkMTL/AcSBF9QUgrbOdJn1bW8KGnb35MAExOrAlm15OxUWF42VzqlTTmEua+s4jusUA9I4IuZfPLIgip6O8DIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714993199; c=relaxed/simple;
	bh=sHYZaWmfDRzKzlIiPdRNF18IWRY23/RhfLJWuB8vfyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4WnKwaueArWlo0rXMdG0iwJtFIUrLSKhNN2bvkUHLJVbwZAX9MrlLKZtOTOHc9DA5+KTyM9BCk8DfhL+loX9iznllMSksUchYIK+z30uojtdPscM1TNcfveH84tPAZbVdudmX96OPJweDm9sF/0vUkJuaCX9rHfCzsXx77SFgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz5u+8Nw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ecd3867556so11128815ad.0;
        Mon, 06 May 2024 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714993197; x=1715597997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJamX9TTA5ozFRtXzVtK6/RgerXqdmilnzpt+IxTl7s=;
        b=Tz5u+8Nw9HnGCKcrqJ09HCBwbLyx+WB86tRn5F47rVZTlNFxNciq1FLxxxc6aPPuP3
         XpK/QOz4NNsp2Mw4wAFhjFGMn25oJ84yvDO++Acw7Q8Of12Nmp7vu8ahb/+bvA5xhxLv
         QZ22LrS/K95ZmfEvnLcsCPhS13/XBYyv7nRH5y6ff8zv0cCleJLYhEs+btFGOe0otCRk
         3tcysVwS0/6A173wso0cJZ8sbKsxIqA+0eERCtpip121OAhcbpeDNLT3FAbOfv1BhQOf
         mR1gZXIRc3ArFYNxVk9d8WEQdGoaDa9erroVOdyKhH6YPTXAXyAElW1YQDY/Fod3/bgm
         9ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714993197; x=1715597997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJamX9TTA5ozFRtXzVtK6/RgerXqdmilnzpt+IxTl7s=;
        b=sgk1WTa7wzNVyD9oqdD6Y9JwPa0pk3GLx5Jj3dFMS43Tpym2/nKevmGabEagYMNKSf
         ikP2McVhj2aJ6Rw+iuyr6cOk/Edm43chtOzB3ATNbgblIlc0m43baK51eUelkdgLQHlL
         vCFPuPFb1A97kwmcYzUIFkbBuLLq+Oy7rtqQWKEsL1AfJv1asr8YMCzTfLwpvfak24gY
         N7PNA0LZIX9dpOzptcMPLX+iHCMW7V8oO6OQHb2G+8aVYdBEiy/2WKE8iClX/n00i8rf
         jQiYIfLejiuUCZoHhA0joFfZfTXGIIa8m7L0w6/5WtWeq3jP4iF6VrmQgstAYTtYIDQ5
         qLEA==
X-Forwarded-Encrypted: i=1; AJvYcCVAtfy6+F9woyZE8ZfciCqQ1Y3vIxol69xF0u9ETjppQ1i6lDtEtYXnUXcfMFRnrnszy5/4rkI1UF4rnkr0JoUs5297dIaPqmibdwmA9Eh63fMk/qEGK09ozmgoQ0cRmXaW/55+pcwGug==
X-Gm-Message-State: AOJu0YyAn36xcGQTufj9JjQ2kxStBL5vOrWFp4QhAyixpEUQwhuw5CHG
	ldoenUuxlU4ntu8uM4JQ1Nkr3dMTM1Sxf8se7gH+22bs7AL9RFzA
X-Google-Smtp-Source: AGHT+IFM87zu5cIMc1I4BWtLdWyxQNhwkpcxaQE7IypFNm5dIz0QAahEFKlUlkxKpBryaGBlGml1Tw==
X-Received: by 2002:a17:902:b607:b0:1ea:f9af:ee99 with SMTP id b7-20020a170902b60700b001eaf9afee99mr9566416pls.25.1714993196487;
        Mon, 06 May 2024 03:59:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id c8-20020a170903234800b001e3e09690c6sm7987845plh.199.2024.05.06.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 03:59:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 20682184790CF; Mon, 06 May 2024 17:59:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation: tpm: Add TPM security docs toctree entry
Date: Mon,  6 May 2024 17:59:36 +0700
Message-ID: <20240506105936.37073-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=bagasdotme@gmail.com; h=from:subject; bh=sHYZaWmfDRzKzlIiPdRNF18IWRY23/RhfLJWuB8vfyY=; b=kA0DAAoW9rmJSVVRTqMByyZiAGY4t6rIVWeAlvNBVJ28YVOyQGnfzPfrWmN/G57CRdHL6fAIs Yh1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmY4t6oACgkQ9rmJSVVRTqPjxAEA/0aZ NqKxpXB/QspqxXTpv0wioowr3gicQlsFCbH7hvMBAOSK8JmBx0+VM0jQLvaTsr6301Qa2axd4N/ blaisvYQD
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warning when merging tpmdd tree for
linux-next:

Documentation/security/tpm/tpm-security.rst: WARNING: document isn't included in any toctree

Add toctree entry for TPM security docs to fix above warning.

Fixes: ddfb3687c538 ("Documentation: add tpm-security.rst")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240506162105.42ce2ff7@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/security/tpm/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/security/tpm/index.rst b/Documentation/security/tpm/index.rst
index f27a17f60a9602..fa593d960040a9 100644
--- a/Documentation/security/tpm/index.rst
+++ b/Documentation/security/tpm/index.rst
@@ -5,6 +5,7 @@ Trusted Platform Module documentation
 .. toctree::
 
    tpm_event_log
+   tpm-security
    tpm_tis
    tpm_vtpm_proxy
    xen-tpmfront

base-commit: 152585665f0f6b89e67ed6d04c17b18d1f0f4077
-- 
An old man doll... just what I always wanted! - Clara


