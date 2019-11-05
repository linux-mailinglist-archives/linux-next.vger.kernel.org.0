Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76575EF592
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 07:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfKEGic (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 01:38:32 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:44476 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEGic (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 01:38:32 -0500
Received: by mail-wr1-f51.google.com with SMTP id f2so10991878wrs.11
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 22:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=paB2icXHqFw63Sr2zuomQPUU7PKrd8nhkcP57Rr5nkc=;
        b=qzA45J4iqkGtf1yyQikv9ami0xd4SlUXKO1VOE3bHa4n0dGT+yObRqnPnBfT+K8z2p
         4W4SGPOMYn5pvl2+B4WaJOs4CsQpwi6NSIRMsXpQ9bHpeeLvmS7t8e1gQV1FghZPeZbB
         A6TYX9W7FqA3pik3KRfF4EKk/O7cw3W75HBp59dSadgGHHEHMWou2B8cG2tCho/a5A69
         ip7ArEgMuxb2oYJ87UJoEUL6q1guTiFvtiE/UQnwZCz4czhrehMC2GbydJocnVjQ0Z3U
         kwB+qgmyeTlrNYhqB1lP0j9e9XLvR/7i7WeMkAZpCXofaCm4FKubHyVzM/3uJBpQBs6X
         rbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=paB2icXHqFw63Sr2zuomQPUU7PKrd8nhkcP57Rr5nkc=;
        b=qagGCWm+B7yxh3Nb47sparSsntKJZocHjxe5i7eNL0ud8ryH/biKRo9SKKyyOhljGp
         lOqp2R70BZbzBVzSOvidb+CIlSRyVy//bz9/GmjRmvMwpv5GzSRBmffnTX0Vhh1cUyLp
         695He9krNwBkJlGWn4UXlgu+RniYULEVhXkUXvBknqSKRyEpvhhqvpulsqQefJwUi6vk
         +j57IPI3PONTSclGCaTE/YaPopwGZ4/uzG3bTZOYH9ZOIFqhLwA92FvD+VT0TzhqOThk
         0lRlpNHanu6IU2hwdIH5vWoGMELrkc25zCO9WnYO2dZU8P96p3mMwaMYMFWxWCWU5Alx
         cdBw==
X-Gm-Message-State: APjAAAUXkyn1CqUq4lnEFvWp8YUEaEAB8PDN4Z3xpjifmRJinbxwCpqz
        3RDtuALN26hlgd2o6yHApOX4Wksd8qu9Uw==
X-Google-Smtp-Source: APXvYqydPaXC88y+yBmZc3L/ESO/UMWcOm9te56DAkODKWXe0Csc8NxkFXDSiEgApzLXYu8JyIx+zQ==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr25908057wrp.38.1572935910682;
        Mon, 04 Nov 2019 22:38:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a16sm27251633wmd.11.2019.11.04.22.38.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 22:38:30 -0800 (PST)
Message-ID: <5dc118e6.1c69fb81.53545.57e3@mx.google.com>
Date:   Mon, 04 Nov 2019 22:38:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-132-g18696339da4e
Subject: next/pending-fixes boot: 231 boots: 0 failed,
 224 passed with 7 offline (v5.4-rc6-132-g18696339da4e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 231 boots: 0 failed, 224 passed with 7 offline (v5=
.4-rc6-132-g18696339da4e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc6-132-g18696339da4e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-132-g18696339da4e/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-132-g18696339da4e
Git Commit: 18696339da4e7035aede4971ee4e85e9aa393844
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 25 SoC families, 26 builds out of 215

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
