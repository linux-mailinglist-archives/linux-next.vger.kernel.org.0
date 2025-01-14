Return-Path: <linux-next+bounces-5202-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F7A10E05
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 18:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB20163FFD
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 17:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6650F1F9EB3;
	Tue, 14 Jan 2025 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVqREV0h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4841CEAC9;
	Tue, 14 Jan 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876644; cv=none; b=fIttJqHDBRS69+raTh5e78BaF1o/RJdln/ptFEXX+PhmmCxmWCLUzJE4LP1YnzFmOiP/zj/we5HWtOKGzgnmI/ePjb9Fd9pjFYvzZTVawoGA9i6GHYXcqKB9P61nYSxV6k5nqwdAzCXZsXiibF6Qh1v2uoCbLxzMVNTu1w5rZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876644; c=relaxed/simple;
	bh=VRsSw5lqm+A9dvd4yXli3w5H6THOXg+8Xzy0GFLalRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIRx3ku9rOsrq0qydqPigw8bn2yRXyf5cKaQgEkF6jZs5mHH9M9vrrEJsSZl9glbUNJ6SWY0hUTerLtTLp0i2zXl5bdH7rsbZeUt4DIymkNME3sXbFfhjPJTvAR+pqOE8DwpMyt22oG5Z32WRktrl7QNBDKLRJha+ID2wklCNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVqREV0h; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso1286311241.0;
        Tue, 14 Jan 2025 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736876641; x=1737481441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGJ6OR6E9t/0+QtYxOhIJa/XcOL3XFsmtM8yDFw36Kk=;
        b=QVqREV0h7fv3EGCyH7bUNSQg+qXJaEKQoWlxLXxnuVFqACyOKYnkl1vssGoCZw8ILR
         OSVxrakcfGhpK0HHLy3Gtj2wTHAfXg+xpq/pvha7GkiilQ/8roMqGRmKjoJf8Y1GbCFx
         Qo/isYXlCRkH4Guh6saXrDZSeJUndRTp7j0kUWkVKa9o61xbxaE7vQo8V/+qLD1k8NfT
         6ZIotKl92tQzl5zljX46e/UAY3KNB1vNM+fE+UpFTV4LkBBu7wDWmRge4ak/vpREpPS1
         H6LX9+9cVBsH+zfHB2loRjCY6o4oU0pqzqcP4wiebCPmjPXe7UfOEgLz+w1cyVRjF8Pi
         i8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876641; x=1737481441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGJ6OR6E9t/0+QtYxOhIJa/XcOL3XFsmtM8yDFw36Kk=;
        b=GgpXLAzgA9L1YyRJWazKdVi6oOEyeZGAgX6/kOrxk1WJi3w9SBs7447af4Hv3p7blz
         eNfDOzyC3SnDNEPeBrUY6o7Z8FOKk7RwbRu4Ja2XSr3KmbsEKH6Ix+pSOSoIFIV6WNgU
         GzMtAWQVhPakxqt/GXjjxoEc+X/pgPdN+4dqGYm5Zy/tJn752EFhrRr3OoKKISbxSYl4
         9HSQg7lQXvLf+hG3dOiRc0U+qLzK3uOKmKKEI6eKL/5hzPvw90IMiPz56aSX/Y9dtU2l
         m5Ck+/3WyWrCM4zK9YoRoUXTtZeHqjOLxONoLDg0LS8gta01hGkcAaVqytjeTkaipI5l
         XHOg==
X-Forwarded-Encrypted: i=1; AJvYcCWffkL11R5uaTXBCCKfxlpKEOw+frjYFSgTqS5QSVtxs6tZqw+YS942L59BgvGOkM7D/HHy4gxKRcLchg==@vger.kernel.org, AJvYcCXBVNLeGex9AJDqMzg46dpH72O5GM+9zaUDC3YaI8H80OnPiJY+New5iG7GfocHxq2OFhyzIBoemmK+/Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIirqfZtgKFejuGmrU7d6HXk3gPEkBMQkTma8vx47IbfXsHMv
	1q3znGWnyaKAArXmkoChMN3Hms0kCgMgGNz7Kswi5O9AhdGJyJOTuqp0ew==
X-Gm-Gg: ASbGnctgdwpBz9Oox5nYJmcIDWg5/6fgstjL8045V3UqGKXuPuCQuGZ3vywb3gmasXd
	Awol7KuaLPA2cxXFB+KzS3SDkzgnzma47kUZSvVAUm6HzDI3I8WlNqq706FB3vEz4BANObRmsLR
	FVgaLNhBN+SZJcVAcMx8IwwrRze0qJsai2TphVC100SddeMQXZcHVJdHu8bPr6uH8IWiBDAHXc0
	yzdHLTWM1bj5uEnOA4yt/jgP7YRZQjCWXa6ilxRW4IsLzwuV8eQsiK+ozIEGEtM
X-Google-Smtp-Source: AGHT+IHx7IKXFnnzxAss/GM8JxjJnt/RKirdD6RZCyVJiKco9rLYCqphQUdGFn4iKhOCISAdi/9uAQ==
X-Received: by 2002:a05:6102:b12:b0:4b2:5ca2:5b5a with SMTP id ada2fe7eead31-4b3d0f05be1mr22867102137.9.1736876641429;
        Tue, 14 Jan 2025 09:44:01 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f04e3esm4797329137.5.2025.01.14.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:44:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: alienware-wmi: Fix zone attribute declaration
Date: Tue, 14 Jan 2025 12:40:05 -0500
Message-ID: <20250114174004.143859-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Statically declare `zone*` attributes.

Fixes: 7c605f6460e8 ("platform/x86: alienware-wmi: Improve rgb-zones group creation")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501142200.ezULWY9P-lkp@intel.com/
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index b4b43f3e3fd9..d7f577e0d146 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -518,7 +518,7 @@ static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 0);
 }
 
-DEVICE_ATTR_RW(zone00);
+static DEVICE_ATTR_RW(zone00);
 
 static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -532,7 +532,7 @@ static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 1);
 }
 
-DEVICE_ATTR_RW(zone01);
+static DEVICE_ATTR_RW(zone01);
 
 static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -546,7 +546,7 @@ static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 2);
 }
 
-DEVICE_ATTR_RW(zone02);
+static DEVICE_ATTR_RW(zone02);
 
 static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -560,7 +560,7 @@ static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 3);
 }
 
-DEVICE_ATTR_RW(zone03);
+static DEVICE_ATTR_RW(zone03);
 
 /*
  * Lighting control state device attribute (Global)

base-commit: 58126788aa7726c0e91de6b25e6e332fa06089ab
-- 
2.48.0


