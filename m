Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB00732D63A
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 16:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbhCDPNY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 10:13:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:37726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233942AbhCDPNL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 10:13:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57DE564F8C;
        Thu,  4 Mar 2021 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614870751;
        bh=25xF9sxBXzHuPYFIpFmZ8ZpVOt0/JIv2FsYeZt7ebbc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M4LwAL4AChLycJdhLSAJh2Xp4vSt8v3D7rIWX/4Sai9Zd7dNnQZLu6kQ+Zes7fGKm
         ggXD2xslVNoJHvm/HKfsBGSNPmt+peGw8jy+X5VmhvSnUagah6AZoHMw2l4dG9dJdZ
         pJup9xKDMcmNlorPJsJQn+XOmlBlnxdkqSucI3jXVnPTHbOW6+Uh8UH59aPO95feRw
         lKr0pFbHtXrlPaU9zPburnYE8SBEUyJXXqLGd/pr6sbvjwuFJlrB4/jp6Py5qTMNeU
         mAEkqHsjogWHyVKS5RIKKZVt8bWTrwA8x8urYFBbxoMwsblCkNWKfZ/u5fPv2wRFUz
         AqT7tZBLkyJLw==
Date:   Thu, 4 Mar 2021 16:12:27 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: linux-next: build warnings after merge of the v4l-dvb tree
Message-ID: <20210304161227.6bd94bc7@coco.lan>
In-Reply-To: <20210304125042.68cc1041@canb.auug.org.au>
References: <20210304125042.68cc1041@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Thu, 4 Mar 2021 12:50:42 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/userspace-api/media/v4l/hist-v4l2.rst:818: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/hist-v4l2.rst:853: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst:47: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:39: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:53: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:67: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:83: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:97: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/subdev-formats.rst:140: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst:75: WARNING: undefined label: decoder-cmds (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-dqevent.rst:234: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst:156: WARNING: undefined label: dv-bt-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:41: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:246: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:269: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst:100: WARNING: undefined label: modulator-txsubchans (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst:119: WARNING: undefined label: tuner-rxsubchans (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:167: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:245: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:396: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
> Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst:73: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
> 
> I don't know what caused this, sorry.
> 

Those are because the identifiers are misplaced. There are several
modifiers that will affect how a table will be displayed:

	.. tabularcolumns::
	.. cssclass::
	.. raw:: latex

Those three above are needed to adjust LaTeX PDF font size on big 
tables and:

	.. _identifier:

to create an identifier (named `identifier` on this example).

Such tags need to be on a very specific order. When the order
is wrong, Sphinx will ignore some of the tags.

Unfortunately, I never saw anywhere at Sphinx/docutils what
would be the expected order for such tags.

The enclosed patch fix the warnings, but I need to double check
if it won't break the PDF output (because the other tags
could be silently ignored).

If the patch is OK, I'll merge it via my tree either today
or tomorrow (if something goes wrong).

Thanks,
Mauro


[PATCH] media: v4l docs: move some cross-reference identifiers

Sphinx doesn't allow placing those cross-reference identifies
everywhere. Misplacing them cause those warnings:

  Documentation/userspace-api/media/v4l/hist-v4l2.rst:818: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/hist-v4l2.rst:853: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst:47: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:39: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:53: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:67: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:83: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:97: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:140: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst:75: WARNING: undefined label: decoder-cmds (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-dqevent.rst:234: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst:156: WARNING: undefined label: dv-bt-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:41: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:246: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:269: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst:100: WARNING: undefined label: modulator-txsubchans (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst:119: WARNING: undefined label: tuner-rxsubchans (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:167: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:245: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:396: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst:73: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 253e4bcc949d..0b879c0da713 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -19,12 +19,12 @@ please make a proposal on the linux-media mailing list.
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
-.. _reserved-formats:
-
 .. raw:: latex
 
     \small
 
+.. _reserved-formats:
+
 .. flat-table:: Reserved Image Formats
     :header-rows:  1
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
index 7a8f490131d8..7ccae3b91616 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
@@ -129,12 +129,12 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
       -
 
 
-.. _decoder-cmds:
-
 .. tabularcolumns:: |p{5.6cm}|p{0.6cm}|p{11.1cm}|
 
 .. cssclass:: longtable
 
+.. _decoder-cmds:
+
 .. flat-table:: Decoder Commands
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
index dfc45427ea23..6518d857c131 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
@@ -240,12 +240,12 @@ EPERM
 	There are no horizontal syncs/porches at all in this format.
 	Total blanking timings must be set in hsync or vsync fields only.
 
-_dv-bt-flags:
-
 .. tabularcolumns:: |p{7.7cm}|p{9.8cm}|
 
 .. cssclass:: longtable
 
+.. _dv-bt-flags:
+
 .. flat-table:: DV BT Timing flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index a90c433e430c..01773f01c4a7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -342,12 +342,12 @@ still cause this situation.
 
 	Ignored if ``count`` equals zero.
 
-.. _ctrl-class:
-
 .. tabularcolumns:: |p{7.3cm}|p{2.0cm}|p{8.0cm}|
 
 .. cssclass:: longtable
 
+.. _ctrl-class:
+
 .. flat-table:: Control classes
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
index e73d24f12054..6bdf925f9a4a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
@@ -119,12 +119,12 @@ To change the radio frequency the
 
 	Drivers and applications must set the array to zero.
 
-.. _modulator-txsubchans:
-
 .. tabularcolumns:: |p{6.0cm}|p{2.0cm}|p{9.3cm}|
 
 .. cssclass:: longtable
 
+.. _modulator-txsubchans:
+
 .. flat-table:: Modulator Audio Transmission Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
index d392e37f080d..b0522f1ff7a4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
@@ -296,10 +296,10 @@ To change the radio frequency the
 	instead of 62.5 kHz.
 
 
-.. _tuner-rxsubchans:
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
+.. _tuner-rxsubchans:
+
 .. flat-table:: Tuner Audio Reception Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 583fa551f0a1..9af43f913694 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -494,12 +494,12 @@ See also the examples in :ref:`control`.
 
    \normalsize
 
-.. _control-flags:
-
 .. tabularcolumns:: |p{7.3cm}|p{1.8cm}|p{8.2cm}|
 
 .. cssclass:: longtable
 
+.. _control-flags:
+
 .. flat-table:: Control Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 4c8d5a15fd29..417f1a19bcc4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -79,14 +79,14 @@ information about the try formats.
 
 
 
-.. _v4l2-subdev-mbus-code-flags:
-
 .. raw:: latex
 
    \footnotesize
 
 .. tabularcolumns:: |p{8.8cm}|p{2.2cm}|p{6.3cm}|
 
+.. _v4l2-subdev-mbus-code-flags:
+
 .. flat-table:: Subdev Media Bus Code Enumerate Flags
     :header-rows:  0
     :stub-columns: 0

