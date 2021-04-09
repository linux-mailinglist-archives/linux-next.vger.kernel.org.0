Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68E33590CD
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 02:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhDIAKH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 20:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIAKH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 20:10:07 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ADDC061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 17:09:55 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so4065647pji.5
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 17:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=I5R8GZYP40hmTak0SZ0dnDxXiGVdP+pUJMQ2Rj/M+eE=;
        b=WE6aH/S+QtaVb3z+aBXH4yOM/auKhhgCMtkXVNnXPFZB3wppK6zyZXZtApL5C/OR3B
         Oc6Fw0ep9A08/v5MM9PhGp/nf8i2jOy2I564r4+W5Co4L3b2o230XQDRIO5F1wLLlbie
         fOr0HejyqUPA8rcjfN2T2CTTPQsV+PtpWK8hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=I5R8GZYP40hmTak0SZ0dnDxXiGVdP+pUJMQ2Rj/M+eE=;
        b=iKj04jVJ/Pf3+mxIv1qB6iAc53dYbzu+ZTsDTMahsDJcbaSOlXD6CR0YvBawor+VS5
         bxfM2Z4jLGHN12R+IL5VfCOjEeVRSdErgrT54z3kY1bkFtk/h/mtPqaZPsL5wkyW5mrU
         DQHciFgQZ0w3OzQDwcRyHrozj/7l45g4gNop9iiSyzKsN+0UkByKKi7rw4/iMQse/e5s
         evO4jHaU8Zeu+yzy5WfjDUokAx4DKmpUCKXmeYt0ZHWy+FgBvvz35lU++1FatzKmuSUp
         OxbO34L0Jj4I1LqNXyu2mcBNPB8sgwfaa+EC+TeHs2a6hZBVSG4N/NZL9oSW5LOZyeay
         TsLA==
X-Gm-Message-State: AOAM531aCasZBmxwwl8/BIpHVlLAhm5Sn243NGLt/Tw95Zs10fwbCe05
        AXtAauMkaBf2KGJvMx9YJttjVQ==
X-Google-Smtp-Source: ABdhPJwD6J6ye1MDW3yrQ/U4hB61elzrsylt7zwnfB1zEg939FDUp99LSq/xPTygCy+WPrcfjRj6lg==
X-Received: by 2002:a17:90b:1114:: with SMTP id gi20mr11171927pjb.23.1617926994741;
        Thu, 08 Apr 2021 17:09:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z4sm435252pjb.13.2021.04.08.17.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 17:09:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 17:09:53 -0700
To:     Gao Xiang <hsiangkao@redhat.com>
Cc:     Chao Yu <yuchao0@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: erofs_get_pcpubuf(): Program hangs
Message-ID: <202104081709.48778B3@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210408 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Apr 7 12:41:22 2021 +0800
    91a196935395 ("erofs: introduce multipage per-CPU buffers")

Coverity reported the following:

*** CID 1503700:  Program hangs  (LOCK)
/fs/erofs/pcpubuf.c: 31 in erofs_get_pcpubuf()
25     	raw_spin_lock(&pcb->lock);
26     	if (requiredpages > pcb->nrpages) {
27     		raw_spin_unlock(&pcb->lock);
28     		put_cpu_var(erofs_pcb);
29     		return NULL;
30     	}
vvv     CID 1503700:  Program hangs  (LOCK)
vvv     Returning without unlocking "pcb->lock".
31     	return pcb->ptr;
32     }
33
34     void erofs_put_pcpubuf(void *ptr)
35     {
36     	struct erofs_pcpubuf *pcb = &per_cpu(erofs_pcb, smp_processor_id());

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503700 ("Program hangs")
Fixes: 91a196935395 ("erofs: introduce multipage per-CPU buffers")

Thanks for your attention!

-- 
Coverity-bot
