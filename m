Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75F9EE666
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfKDRmy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:42:54 -0500
Received: from mail-pf1-f172.google.com ([209.85.210.172]:46312 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfKDRmy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:42:54 -0500
Received: by mail-pf1-f172.google.com with SMTP id 193so11443027pfc.13
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=T2iSHjrG1f6Mt5tZ6l9ysrdbRNvOV1ZvgUhW0s/21+A=;
        b=ADE0465cV+kRG3Er8vhHsy2yE7VatZPG39NBpdM6No+PS8F3q7iRRQNZBxBWpAEJQA
         2smyaKFhGvg15gh/+Mb/wcUcfEI6y42Shrh2HnMJq8x3z3V99d/i2LWxj33Wm5r1ANrS
         c4BEM15J2s7Cotxy0Z250W+udhuWnBx/3Wcc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=T2iSHjrG1f6Mt5tZ6l9ysrdbRNvOV1ZvgUhW0s/21+A=;
        b=ZDlEG4H2nhC3b+w2oDI3ihVcXtTCMyJBFOVnWQfFfAOiLjda3uo83ugOM/gWl2qTL6
         +kxBYgfP6n5LkOq6G5fAkw1GCyAkGVLqMSMDjvfWq8lbXDNW+EUfqOU6cu4Uw+w/aQZz
         4Pnp0aeBIiyV9Klg6vKc+2X4K5W3A7R4F3EM9yp2PEUKOYwXNMeHjC+aypvjgrpCDxBN
         3mKmLdcBbLw2f93jdLKgaegpMFc3xlt6jJ9rCWvbSqb4XrYW7La7/r4J6K/FarWwjKtu
         A5G5svwb4g7NxhTvZSpUubadsoZlJjccIIIesLGBTlQnrktF7q1dIRjDcWjVYOw+cdei
         e6zA==
X-Gm-Message-State: APjAAAUtdMETJDcU5l+15p1Nw8wIrZZlmSwcQPKU4Cl4s2In+iLgXwkf
        5hW5Yed9MeUqPrAXyInZR5y+YQ==
X-Google-Smtp-Source: APXvYqzXb7Y6F9qrU0bJT+60cpRmTuBqsN4t8ArUvIJU6eUwx+kMys32o0GuahZWbkLqCTV+YaFJZw==
X-Received: by 2002:aa7:8192:: with SMTP id g18mr31810215pfi.22.1572889373429;
        Mon, 04 Nov 2019 09:42:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q20sm3802284pff.134.2019.11.04.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:42:52 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:42:51 -0800
To:     Lyude Paul <lyude@redhat.com>
Cc:     Sean Paul <sean@poorly.run>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: drm_dp_mst_process_up_req(): Null pointer dereferences
Message-ID: <201911040942.CA1A7EE8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

9408cc94eb04 ("drm/dp_mst: Handle UP requests asynchronously")

Coverity reported the following:

*** CID 1487392:  Null pointer dereferences  (FORWARD_NULL)
/drivers/gpu/drm/drm_dp_mst_topology.c: 3710 in drm_dp_mst_process_up_req()
3704
3705     		if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY)
3706     			guid = msg->u.conn_stat.guid;
3707     		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
3708     			guid = msg->u.resource_stat.guid;
3709
vvv     CID 1487392:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing null pointer "guid" to "drm_dp_get_mst_branch_device_by_guid", which dereferences it.
3710     		mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
3711     	} else {
3712     		mstb = drm_dp_get_mst_branch_device(mgr, hdr->lct, hdr->rad);
3713     	}
3714
3715     	if (!mstb) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487392 ("Null pointer dereferences")
Fixes: 9408cc94eb04 ("drm/dp_mst: Handle UP requests asynchronously")


Thanks for your attention!

-- 
Coverity-bot
