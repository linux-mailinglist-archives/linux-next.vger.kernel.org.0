Return-Path: <linux-next+bounces-7187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A85AE1109
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 04:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D580919E2521
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 02:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B6B126BF1;
	Fri, 20 Jun 2025 02:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffUjgbHD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C743628FD;
	Fri, 20 Jun 2025 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385884; cv=none; b=uviwcGMWDgV7zYzZ/Xi2bqZAFN4SIbHNXxDZTLk2aYeObv+Hiqv+svZECVp1pnzO2rTmFyzpU6hjrdR1pQ5tgqTxL+oWOdcQyZBMaX7uLZU7MCA50UkbwBmqbE9/nByV7NsXQgVjpyLRaIoZcY3JIIPn3enKKi3fsZMQi1el7fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385884; c=relaxed/simple;
	bh=6MCffwkdHeIHrVXhbn54erx3b/fYlg9DTNvSFcS+Igc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IMV3x1Oxw4wQfkTp0GgsUtNTQHP4BDPxLBEPRwAtbuU+OfGM5DIMFLHRV4r5xYoHib2jHXB6/+yPnfLQjDgv2UbtxanklWtjDvxpOw7BQ69CBv2pqiWD29Wbk19VuHHbpHWTuhUAHZx/zbxt/7Q3iiC5jHmVRKlZrKPvcTReBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffUjgbHD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso1577046b3a.3;
        Thu, 19 Jun 2025 19:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750385882; x=1750990682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrAwGmYD6smdn/1bwvG0NE4H0xPUOXXyruWhgIcWsJo=;
        b=ffUjgbHDrDGJaKOAtyhbaI/xhxAeehs1BAl3sixiNtH67AThkge4M5XL1k05DCAjPG
         6aLnkrV0MtBNZLypL8xzRecPvinUg7NLus5RF8QLKDxGelg1NbdYVDYtsshnr+SSoutV
         fKNiE9aSjDzTaYjJvdCMYcNOilhEY80rC/0kqaSo6j6UDxl+j8f8dXcxObKVsx5RPjFE
         X1ydMBNWYeuEFwOxd8WcGwXjW98Ux37T8f2uYquBZvWZZA8HkwnbdaHXBhzvXDqwCrCP
         f+Y5OLnhwAESJr9FWYVb1kNpyOVyxkzNKb6BLmh003TUOQcGYN/PzBnAX6fpjP5uXbTl
         47gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750385882; x=1750990682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrAwGmYD6smdn/1bwvG0NE4H0xPUOXXyruWhgIcWsJo=;
        b=T3uCk9wOlbssZtHbEBb/Thjr147L3sRzSXpAya6gTim9lTwBl4DITpTcLqOvb9HVAL
         32kMwg6TdC75ZUONbgM+QebMyMsfLWxCDL94Xun02sZhUY9+oCf5+ALf1SrE3aAuFrYp
         5/jobEnMGWOjxAGfBINiOn4aTE4AFUUm64s5lo61Ko+FOpRIM1j/XgCoDkiH/n9hZuO5
         9glVujAJEMmZWmdF+0sE3sqdSROGHLGqmAuIKn+XQLbykumIs0m6KTW3M6Iu0FJ9edVo
         EpM6qfWKTAR2BayfPJPC/adMTbkYVouBgHewa+mKkrvYx2BUxiA+o/l8e3Ehp3o2up1N
         8BaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdKXv/EQXGhMU8fbcra9AnuxYLt9F7gvXVQvRIvlLDJjwDDLHtVr08b3nmImU2vxqhUzw+TIBv8Fct@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwFFXVO4THbQn2cluBzhp/1Idh52eJKXA1/7TWl0Z3keFQpIl
	SgS/0pfLmly5MQe7auyv+ZyfKJ57n2e7d33Api7msXT/Bv+9lsdKF5u6
X-Gm-Gg: ASbGncuYIIi8tPSvxlc997nyx33kDQibUGsGK7C4iwd8esGml1AYN05BDn0qLI/m66e
	BK7FNJ6iqpqPRNftniJpWfrS8BaNxZSuEdmqyreC/jGvYDEJUhgexQZL2DhFBG1+dkFz1hhC1/P
	NA+YuDPdVaHSoeTr5AtF8jTALBDsuRdnE/mOCiz8o7pWaC1L9/VhJOGsfansyk8CfBfzp/SV3HA
	fdhdHRconyEm+r78sma5rGmZt+HPL8UitHmY23Au8y//IcARCmqVlvecF/FeeW3/Zq2FB1IQ+Bf
	UQrLj1wB5aEVpvYYNhU26DXlPL+7GQIE+vpVsD3StGJaM6A+szfJMUI/FLGhKVguv8KvYe+TMYf
	HWCDY8hVC6F4ifH/yuiy7CQDy+l4oCLWEhY8=
X-Google-Smtp-Source: AGHT+IGa81kAriMSCsca0OKoBHvxPEwEHy/Ct3EWldlcMjXEdkPkRSl57mtl2UgfH04e4BDa99UnlQ==
X-Received: by 2002:a05:6a00:170b:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-7490d75a080mr1354457b3a.13.1750385881940;
        Thu, 19 Jun 2025 19:18:01 -0700 (PDT)
Received: from SHOUYELIU-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6743c5sm845105b3a.143.2025.06.19.19.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 19:18:01 -0700 (PDT)
From: shouyeliu <shouyeliu@gmail.com>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	sfr@canb.auug.org.au,
	shouyeliu@gmail.com,
	shouyeliu@tencent.com
Subject: [PATCH] Documentation: amd-pstate:fix minimum performance state label error
Date: Fri, 20 Jun 2025 10:16:58 +0800
Message-Id: <20250620021658.92161-1-shouyeliu@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <87jz57h6us.fsf@trenco.lwn.net>
References: <87jz57h6us.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shouye Liu <shouyeliu@tencent.com>

In the AMD P-States Performance Scale diagram, the labels for "Max Perf"
and "Lowest Perf" were incorrectly used to define the range for
"Desired Perf".The "Desired performance target" should be bounded by the
"Maximum requested performance" and the "Minimum requested performance",
which corresponds to "Max Perf" and "Min Perf", respectively.

Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index 412423c54f25..e1771f2225d5 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -72,7 +72,7 @@ to manage each performance update behavior. ::
   Lowest non-        |                       |                         |                       |
   linear perf ------>+-----------------------+                         +-----------------------+
                      |                       |                         |                       |
-                     |                       |       Lowest perf  ---->|                       |
+                     |                       |          Min perf  ---->|                       |
                      |                       |                         |                       |
   Lowest perf ------>+-----------------------+                         +-----------------------+
                      |                       |                         |                       |
-- 
2.19.1


