Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8EEF867B
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfKLBgI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:36:08 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:46328 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfKLBgI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:36:08 -0500
Received: by mail-pf1-f169.google.com with SMTP id 193so12073171pfc.13
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8MKkG231krPcXxZTqO2vrn5Y8jyBvYckGiQcn+jM3Io=;
        b=JA0XCL55StdbN1KhMb+E/FJpzt+KBb+G8USskrEgi6Cw/ZvtW0ZvISI9yJbEtouRnX
         Rr12Zx8HfIA1vNcZZk9sE0DZmS2fvwEs2ut1IJL9q3/+otACM8rfdgCXe4sVlesUlXtU
         /qZgQCQErVuKo8BVUeVX4xugqI/3w9Pr/Qcok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8MKkG231krPcXxZTqO2vrn5Y8jyBvYckGiQcn+jM3Io=;
        b=bxPSWVOlrEq/+C+buyJDjNar26PMzQ2H+yP87MMJtMvMzuEBCUQMzWud38r8QPOBwQ
         +QsVC42O/Az90AgdoDj1GHwcEPd3W0rXcTzYKg4rflXnfYO+O8eHKmKE+ZdpqXnf6040
         lErjgefnfx9ylhkIxSubcWmCzNiwH02zAdrieqozeynRs+TefmD3RK9HRLiMYJWLC+ni
         IVwWMvno3T+NhCrqusryOM/uoIFpGQ1HByHmvgh1A6t7tOodUeyo8qZW0dZcjElihx6O
         d+806kC07a3J1z2izSI6HLTdIZd0hhavfjyabgXU6sADbSRMJOA1Zsq0yf0aficrKj/M
         Ky4g==
X-Gm-Message-State: APjAAAVe6XGTCoLyYl1MRx8iHoctmcNtJA6NFQ9JLVCD3RZ4WiFtRz4M
        G6pghlF+mRc+HmvPp9ZbTpZVmg==
X-Google-Smtp-Source: APXvYqwhGYEscnwGF/2HhnfR6tfti/ccBx6nUsI1df+DLzB53iDskrbMk4oH+xQldiQocWUKh0dyIA==
X-Received: by 2002:a17:90a:a58b:: with SMTP id b11mr2849440pjq.46.1573522568089;
        Mon, 11 Nov 2019 17:36:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2sm15723062pfj.22.2019.11.11.17.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:36:07 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:36:06 -0800
To:     Maor Gottlieb <maorg@mellanox.com>
Cc:     Saeed Mahameed <saeedm@mellanox.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: clean_tree(): Error handling issues
Message-ID: <201911111736.CC9420490@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

800350a3f145 ("net/mlx5: Avoid NULL pointer dereference on steering cleanup")

Coverity reported the following:

*** CID 1487837:  Error handling issues  (CHECKED_RETURN)
/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c: 2479 in clean_tree()
2473     static void clean_tree(struct fs_node *node)
2474     {
2475     	if (node) {
2476     		struct fs_node *iter;
2477     		struct fs_node *temp;
2478
vvv     CID 1487837:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "tree_get_node" without checking return value (as is done elsewhere 5 out of 6 times).
2479     		tree_get_node(node);
2480     		list_for_each_entry_safe(iter, temp, &node->children, list)
2481     			clean_tree(iter);
2482     		tree_put_node(node, false);
2483     		tree_remove_node(node, false);
2484     	}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487837 ("Error handling issues")
Fixes: 800350a3f145 ("net/mlx5: Avoid NULL pointer dereference on steering cleanup")


Thanks for your attention!

-- 
Coverity-bot
