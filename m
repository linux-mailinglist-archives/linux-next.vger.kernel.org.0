Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E63894B8
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 00:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHKWyv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 18:54:51 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39442 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfHKWyv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Aug 2019 18:54:51 -0400
Received: by mail-pl1-f196.google.com with SMTP id z3so327921pln.6;
        Sun, 11 Aug 2019 15:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/+fFLa98aDF+/ECXAf+aOcDlbTv22LUhO4jnBy4r4M=;
        b=hyW1s/uKm7N3bo52oGeKHPxhYEav9Ky28Dg7WCiRCbYwHza4Mbcs5wxxs8zOeoI0Po
         AeKz/yhCfeb1XQ/yhb6uiOnLMRdcEBteTnykfxXYhPwfnO3o25Eza1UPnuEh4FsAAOF4
         G1qZp37wqXMjy/lBvfwK4wePsH1TcVEaKN0cvnkWWuv+woDS8Qx7BSWGiMEVu5oeRT5q
         w4FowDPv5OC2SV6nRwRaZMoLC2CLTcNi+YGp1cC2fCTnTYQAU6zWQhONGF07ZGLo841a
         6BPxII/48yDsNwoNRyaM0m+2nSQ7sFHmyz9IDwa5gnEBcxQcsAZm2Aa/4FS+rG5n2C5b
         99uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/+fFLa98aDF+/ECXAf+aOcDlbTv22LUhO4jnBy4r4M=;
        b=C5S7csLHwI2nb8hgRHP+LHciUSgE84ijzdk3FtgbM+fEYbS7/3acEqMBG4kA193qHs
         AL46lkRy3UUewy8KEczJ0kAHzPgchPySkRXwTUlqdyR2dzOO57VtfFyKh28JCI7Opv8c
         /m2K9fJSZCR8xLv6RdB4xd9lQoTDKH5kqcyLf2+u3xH4+3xz624Oj2lxQ7z2aLfH/PS1
         msAN8B7GQLhyiAXalI8lPMJVfCu7Cl5bcV1wSJWAQKcoHuDGGmnRSPKk0QG8LpR8M4Vk
         gCz5NXeJwWD+vy2zh273WG0iIZ43jPrfISLwKqg++M2NUoCxwDO34n8Qo/qrkxerCW9N
         X41A==
X-Gm-Message-State: APjAAAW/fkg6EFP6tF+6oaKu5o4iic8Uyt/LGuWiCmpxSyVLp5VeRlta
        3waNhFm3jC3ETbExsRo19nw=
X-Google-Smtp-Source: APXvYqwTa2GjNMRd9B6X7ITs2R3GTlPqQ0xjsG261sGVx3hOukjspZB/5/ZC6bE1SYxFnsFLlKF9eg==
X-Received: by 2002:a17:902:b413:: with SMTP id x19mr27859667plr.121.1565564090196;
        Sun, 11 Aug 2019 15:54:50 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id y128sm127850339pgy.41.2019.08.11.15.54.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 15:54:49 -0700 (PDT)
From:   john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 0/1] checkpatch: revert broken NOTIFIER_HEAD check
Date:   Sun, 11 Aug 2019 15:54:42 -0700
Message-Id: <20190811225443.31161-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: John Hubbard <jhubbard@nvidia.com>

Hi,

This happens on today's linux-next.

If the commit message of the original patch were just a bit clearer,
I might have been able to attempt a fix, instead of a revert, but so far,
both the Perl and the English are beyond me. And we can't leave
checkpatch broken.

I'll be glad to test out actual fixes, if you like. But here's a crude
revert to kick off the discussion anyway. :)

John Hubbard (1):
  checkpatch: revert broken NOTIFIER_HEAD check

 scripts/checkpatch.pl | 1 -
 1 file changed, 1 deletion(-)

-- 
2.22.0

