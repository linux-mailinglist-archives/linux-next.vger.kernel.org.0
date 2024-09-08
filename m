Return-Path: <linux-next+bounces-3654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B09706F2
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 13:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DD751F21A2F
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 11:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBF2157A4D;
	Sun,  8 Sep 2024 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMxaaB52"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDD1547D4;
	Sun,  8 Sep 2024 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795281; cv=none; b=c5z1qsdqIE1Cayw3dSacelEmS6McGGIfku18UgtpwKGlknjfqjHcdEv6rvTxZ/QYpT2570E70Y7TIxCvxlCJt+peAFKdk+m3mg91B9XovCy11rq/7aUuv8mMN3l/bxWYh1HT/r/l6+G4mD8r6NX/5VC5Y1CwhnEaPqq1IpxOYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795281; c=relaxed/simple;
	bh=l8Afgqu3WXAVFAIqNvZ59IhIs09LB+0FmnTuuXCr790=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+5FOm03+xnrEjOKB823ga77sbfFvmqI0i5s+n4sS4qi4jOR+d6p0iNcSxb9mm2A40CC/IL2A5oM26yRkMV6tjfOI8EJAPzs+Dm8pESjR/hZvPesUeYN3gqXp/eUaLit4ZX0m6eB6KmltkME0gJ8MLr29K4MrL0wbFGNWXuefc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMxaaB52; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20696938f86so29849445ad.3;
        Sun, 08 Sep 2024 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725795279; x=1726400079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TevhFPkg0ehgq3/IrZZMrhzq3fN8W8bdolBRTCGu5DA=;
        b=AMxaaB52Pacbf0mzujeBqi5RpPm8aaDxX0j2HO/KfXrrRmCFeiHkhnLNL3TJp19CY+
         MPWFiJ1nc90TsyMgAmGROBNQ/aE6UyoZScRN7Lvn5nzvatFZL4z0mAga4W8W58MTeXNt
         kpAK/gQuV3ZPB4SjbmyJllLjim8B/T4JtkUj3bg3+cfoB67kt3cICb9RRgI5ssdaqbfk
         Paisj9jhw/NrvdXYDNQdonvsNq/kOpeypRz8XcNgp/1lL+skWOOBkJILjPGsY+qmjy5K
         +143Kt9w4oU8ejl4FrcN1/l4viRIW9y04phZPIY9VFe7quRBC32eIj8OhBCmhCHbHtZx
         JqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725795279; x=1726400079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TevhFPkg0ehgq3/IrZZMrhzq3fN8W8bdolBRTCGu5DA=;
        b=Sg/CHvFfbweaiot2HtK7qNh0OjgJ8AyRrzF9XkR5ghJSrShLZznb26XFPXzNEMP4V/
         UmULit0Eqeax18bxacymuMQRrS0zx7+X+yzB3gB50T6FdZxsnmRefbJjLq3zFo+QQq7F
         CkyjpOJYYIv7jk1glHJsIKb3erj/8MGZZcDx953+5NkcHG8FPFMcMHE9AkUJ42V1LRlJ
         0c1QFFAG2+OCQQLItsgHuEL66O2/cfDIYVFEVcJ/VHvvRrs1n6weHu2tunWS/nEr8InS
         kLMXDMGlQnKZi0fLT02nKvvGsDlfMXmynw6N2VSl6uQ6ARlEMaOwR9ERVtUKffQw5PLF
         nJtw==
X-Forwarded-Encrypted: i=1; AJvYcCVIs1yFJ0yt0cURDKO7F0xQ8JoiP5Z4nX1VYRsEIBNSUEN6Ukkb1NWU8hIfulfcSr1HYH0Wo4ugoBM=@vger.kernel.org, AJvYcCX0SVYDVdmGOrUmQ/YYoE+pi5n281jdNwAITLNLevCwdrCq8Vp5WLlOX1Nq9oLuM83OZJSNMCRfPmw0@vger.kernel.org, AJvYcCX3G3pduJGDlPwTr6F+xq99ot+Z+FXct4LC15Stx6pYQJatDmBWp8FUokAIy2f1As9mFKyNFzQeqFi9mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhXqtBBzTuNPh7Aa4BC/y/c4LiA1mbRjhF6xWwHFsKt/7xdVb
	TEdM2vDs0xRdmeu9C20cV/FOC7JQWpu1DJ1iXEaaMRZwc6h9EalI
X-Google-Smtp-Source: AGHT+IH6GPQK9EkkIM7ZYRVSmYXzhsKD5YcP8izmijFJcd7CdVzsEBDd4KL7pL76B3SbTRorF5l+dQ==
X-Received: by 2002:a17:902:f547:b0:206:ae88:417f with SMTP id d9443c01a7336-206f04e17fdmr111199545ad.6.1725795278085;
        Sun, 08 Sep 2024 04:34:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2071a6109cfsm13980345ad.175.2024.09.08.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 04:34:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A1ABB4A19C6E; Sun, 08 Sep 2024 18:34:31 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	v9fs@lists.linux.dev
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Jan Luebbe <jlu@pengutronix.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] tools: usb: p9_fwd: wrap USBG shell command examples in literal code blocks
Date: Sun,  8 Sep 2024 18:34:23 +0700
Message-ID: <20240908113423.158352-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=bagasdotme@gmail.com; h=from:subject; bh=l8Afgqu3WXAVFAIqNvZ59IhIs09LB+0FmnTuuXCr790=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDGl3uw48Tfu/RCuuck9OdunT1UdCLn944Nl8dsskHollK qqXIr9+6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEjtsxMkw8xnBop8Aap+KN O1+cKlqz79IftZsZvI+6tvJnr0kR9f/B8L9+53RdkbCzO1rnHdz6QMzJtYxvUZaNP3tK66q0R1z vrXgB
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reported htmldocs warning when merging usb tree:

Documentation/filesystems/9p.rst:99: ERROR: Unexpected indentation.

That's because Sphinx tries rendering p9_fwd.py output as a grid table
instead.

Wrap shell commands in "USBG Example" section in literal code blocks
to fix above warning and to be in line with rest of commands in the doc.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240905184059.0f30ff9a@canb.auug.org.au/
Fixes: 673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder script")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/9p.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index 2cc85f3e8659ff..514ed13a0122b0 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -86,11 +86,11 @@ When using the usbg transport, for now there is no native usb host
 service capable to handle the requests from the gadget driver. For
 this we have to use the extra python tool p9_fwd.py from tools/usb.
 
-Just start the 9pfs capable network server like diod/nfs-ganesha e.g.:
+Just start the 9pfs capable network server like diod/nfs-ganesha e.g.::
 
         $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD
 
-Optionaly scan your bus if there are more then one usbg gadgets to find their path:
+Optionaly scan your bus if there are more then one usbg gadgets to find their path::
 
         $ python $kernel_dir/tools/usb/p9_fwd.py list
 
@@ -99,7 +99,7 @@ Optionaly scan your bus if there are more then one usbg gadgets to find their pa
           2 |   67 | unknown          | unknown          | 1d6b:0109 | 2-1.1.2
           2 |   68 | unknown          | unknown          | 1d6b:0109 | 2-1.1.3
 
-Then start the python transport:
+Then start the python transport::
 
         $ python $kernel_dir/tools/usb/p9_fwd.py --path 2-1.1.2 connect -p 9999
 

base-commit: 9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09
-- 
An old man doll... just what I always wanted! - Clara


