Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723741A69B6
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731453AbgDMQTd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731429AbgDMQTc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:19:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21F0C0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:19:30 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so3539883plk.10
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZdouRLJ/FBr+/igs8CbEqlJ9kza6nnPJy2ipegTDjpY=;
        b=cOjNniMEukIJSgumc6hLTT+DcJEkb2PYCf/+9dUiF4FSazDU/8tExzsa8vos8/sMI8
         LliiP92WBtsDmDqvmYNGde5Id6c7JY7+Ygpk5lcVfU3U2ck9UpMKDe/lfRJ1aUuYdGsA
         duWQU2oihifBqYcN6XGtgHqi9iATvoqsvNuok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZdouRLJ/FBr+/igs8CbEqlJ9kza6nnPJy2ipegTDjpY=;
        b=duNfadzvlpiASBSCwUvqoRxsKWw7f1FMvyatZV+DWVaFrs8m4TopCkO5Ptdp/3Ex3D
         +BINv3pgerFhZeAgh+Y8Pob1UaqmDeAoDuHAQ1S52i3LRZipeECefWMzKE3PEtVgczEY
         v6qz4Qn7mWGQODLVcWt70SOpCc9eCUHh9JoHClQYy92H961ro4iB3ar6mTZisOWaSI8F
         uSjMzu8VFeWqydg1hYFukONccHS229rpVSUJ1bkcUdF+KA5eXx5msEDljN7gavdUozHl
         muz/AhGsrJPoPMS+sCL3s0OJOuGGHIrybrBWioiH3BoSR9yBcAyel/VSOzVODq8ykVRu
         dBDw==
X-Gm-Message-State: AGi0Pua2zv7teG7RlKI1NNtM2ie10SYpOBa0dBHkmOh4xkzudV6wQdf9
        8b94WpBZ20ZK/cjNSnYFHGpBxg==
X-Google-Smtp-Source: APiQypIgtWY4OzjordAUyaxuG5QrVVP07eRg8Kkh+lz8+Sw2aCPb57BQfkOa5aBiabQPYpD5S0KZSA==
X-Received: by 2002:a17:902:b185:: with SMTP id s5mr11554389plr.99.1586794770531;
        Mon, 13 Apr 2020 09:19:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n21sm8558879pgf.36.2020.04.13.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:19:29 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:19:28 -0700
To:     Tiwei Bie <tiwei.bie@intel.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: vhost_vdpa_open(): Control flow issues
Message-ID: <202004130919.C9D96730@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Mar 26 22:01:23 2020 +0800
    4c8cf31885f6 ("vhost: introduce vDPA-based backend")

Coverity reported the following:

*** CID 1461662:  Control flow issues  (DEADCODE)
/drivers/vhost/vdpa.c: 682 in vhost_vdpa_open()
676     	struct vhost_dev *dev;
677     	struct vhost_virtqueue **vqs;
678     	int nvqs, i, r, opened;
679
680     	v = container_of(inode->i_cdev, struct vhost_vdpa, cdev);
681     	if (!v)
vvv     CID 1461662:  Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "return -19;".
682     		return -ENODEV;
683
684     	opened = atomic_cmpxchg(&v->opened, 0, 1);
685     	if (opened)
686     		return -EBUSY;
687

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461662 ("Control flow issues")
Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")

Thanks for your attention!

-- 
Coverity-bot
