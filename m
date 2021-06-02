Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8F39801C
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 06:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhFBETj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 00:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhFBETj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 00:19:39 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD899C061574
        for <linux-next@vger.kernel.org>; Tue,  1 Jun 2021 21:17:55 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id i5so1234649pgm.0
        for <linux-next@vger.kernel.org>; Tue, 01 Jun 2021 21:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=mtSaAuWiZJRWHW31U7h2NEY6RUaj0+NwZWeALsZIKAk=;
        b=uhw5Vz0t/XV6dCO6C6hZia8HgopUokHahOvnkP5Gg7tYVUMthZYs/hZmnMSuKPhT3u
         +bzVdgVXeY5QJ1woKKgeXMX0eQZEZG9P3+rAbUuRiFzpZRplBNNcO5VOKnU3e6U7CqtL
         TLlz3swXz41PHdNxtiCfFsf5i0bbW7sl8lTND0g8RofRTwbSSroB56QGhN41rsvIpkMB
         Ux43/mhK0TB4PEpCglbfYQ2haDa520zSOjgRnlWzeaaIRvkKcudws+8CicEngVvMmTg2
         zWhcN9tFmNpEKfOwymAK5l9lzVAu8xlk4aGAGAt4JWkD/9H9GDfW1WEqXObFtQb9k8T8
         MatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=mtSaAuWiZJRWHW31U7h2NEY6RUaj0+NwZWeALsZIKAk=;
        b=ZI0rDF7EWU9TkFqVAvkQ/gZo75GvW3LdBioEYfsJeQ5yRK01wlspbTA6FDn0mDQUMT
         kLNOJbpxvsebZGM3uUII3jB5/gjebq7/QFR9KcA7XqKPkw4HcwSvIF1ptLdrjt+s4q4N
         wkZf8mVjGX4PFVTjqkoMG/puDzGMmC3MpxVF65iO4y3a44IKCB9nk0qynOqVgqGpTWlg
         DQCGsHRD7Lg36XBQm+gJ/JzLa0WYhxLhb+lILP2FboIm61owjVRlC+pcJYPQTzbghFji
         Pqai/1ydwzGeEAtbO3h86JdQadAdgCont9utnaPUYmHGcYS8SqBp3jW0rV/UYbF0mQ0R
         ha8g==
X-Gm-Message-State: AOAM5301aZZxnrbTmqOmWG4GCJ1UNzueAgiiCsHV25kecAIm1K4499Ee
        3PJAJF8Vq8wxAD7fte9HbDyNMg==
X-Google-Smtp-Source: ABdhPJyXusxvKqjWp5isMx1d+LhFjYhYLYM/k7N+B3pFOZtRUrACHwxWtCF9uQDazwO1Gt+ikU4m7g==
X-Received: by 2002:a63:1324:: with SMTP id i36mr17778343pgl.44.1622607475209;
        Tue, 01 Jun 2021 21:17:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s19sm473261pgv.92.2021.06.01.21.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 21:17:54 -0700 (PDT)
Date:   Tue, 01 Jun 2021 21:17:54 -0700 (PDT)
X-Google-Original-Date: Tue, 01 Jun 2021 21:17:52 PDT (-0700)
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v-fixes tree
In-Reply-To: <20210601075713.6cffe979@canb.auug.org.au>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-317af89c-4d85-491d-9eac-439972a26469@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 31 May 2021 14:57:13 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   345f7d3d5e58 ("riscv: mm: Fix W+X mappings at boot")
>
> is missing a Signed-off-by from its committer.

Thanks, this should be fixed.
