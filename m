Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82A11D9190
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 10:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgESICy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 04:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgESICy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 04:02:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D68C061A0C
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 01:02:54 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id n5so2357825wmd.0
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GAvzowp8ctEQm7gDEd4YN2NPgCDtGpVSkCRU+hDllI4=;
        b=O2Wky9A8duWFoGp+rYjpSC7TU3//cc4PxKnhXm14syvXkMGjtoAZx5r+2dD9EEjaw8
         mEjRZPJBmzBNhma59aN5Hn3C6nd2TR9J+CBC4p2sgK9Yy1l2XGy/66MGx9e58sDdPTuD
         O76M7mN3bjI3KdGef5qiAx2H1Bwf1gVoAdA3c9ooYIRKaNqdHtYzhkPz9lW39isn17Oe
         tgO+sof0JCQ9xaIJGskoM5okQDc9mPD0nVoFlYFLWwgR2ZdajvyQztYkbkNxmfMcEgYs
         Y55qnN7SLKWV2DnFMItkhtRM6LgoUIWDE6PJwq9opSFr0n7TsWaZ6XjXKvFWI5sFoCkn
         lkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GAvzowp8ctEQm7gDEd4YN2NPgCDtGpVSkCRU+hDllI4=;
        b=i7OKa76CtyyitaAzZCz6OwR9xPbVARNpdlV8B/xm7BF4fKXI3buGa4Al8ShFcjIU6u
         3Q7DovQ4Z0uLA/p11sOlXBi9OPjsVCelipRi9zatwX9D6Cg0clMHEdYURSTM9yGCLZpy
         I6qjuEg6SwEqfYuveAdZtWG+Fp7KsMIkGwp5ri/FoZD5OBnsBX7Mbuprg4C+wcE6Njh+
         z18xUJ4tuB7pjI1c0iBmv9m7xa+dgTjcIvEX2u0SMkdG2BEzHPSbLb7gmu1mLS8Xwlld
         uvAJK/DSImmKc/VO8s3bEHlSlLhFgIjDU5pcs0RRHUjAXkZhwx+SBO8zrwwmaUL+iFII
         E+rA==
X-Gm-Message-State: AOAM532AlCLteL8PYUh/fgBDAZkBlwp5+/imgkj2lRy1UKdE1J1xVg5O
        R8wDA/umKvUGc9if4srrTja7
X-Google-Smtp-Source: ABdhPJyYv429uc6XmHCaQKhGJrU9gXQ+XOl2Zv+wDcE8FrVLNhN172EIHdiBjZibiPINaTcoaegb2Q==
X-Received: by 2002:a05:600c:2197:: with SMTP id e23mr3983307wme.162.1589875371784;
        Tue, 19 May 2020 01:02:51 -0700 (PDT)
Received: from dkxps.fkb.profitbricks.net (dslb-002-204-227-207.002.204.pools.vodafone-ip.de. [2.204.227.207])
        by smtp.gmail.com with ESMTPSA id g10sm18915386wrx.4.2020.05.19.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 01:02:51 -0700 (PDT)
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
To:     linux-rdma@vger.kernel.org, jgg@ziepe.ca,
        linux-next@vger.kernel.org
Cc:     jinpu.wang@cloud.ionos.com, dledford@redhat.com, axboe@kernel.dk,
        linux-block@vger.kernel.org, bvanassche@acm.org,
        rdunlap@infradead.org, leon@kernel.org,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>
Subject: [PATCH 0/1] Fix RTRS compilation with block layer disabled
Date:   Tue, 19 May 2020 10:01:35 +0200
Message-Id: <20200519080136.885628-1-danil.kipnis@cloud.ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e132ee19-ff55-c017-732c-284a3b20daf7@infradead.org>
References: <e132ee19-ff55-c017-732c-284a3b20daf7@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jason, Hi All,

this fixes the compilation problem reported by Randy Dunlap for RTRS on
rdma for-next.

Jason, am I even doing the right thing sending the fixes for the issues
reported for the for-next for RTRS/RNBD to here?

Danil Kipnis (1):
  rnbd/rtrs: pass max segment size from blk user to the rdma library

 drivers/block/rnbd/rnbd-clt.c          |  1 +
 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 17 +++++++++++------
 drivers/infiniband/ulp/rtrs/rtrs-clt.h |  1 +
 drivers/infiniband/ulp/rtrs/rtrs.h     |  1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

