Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E751B1A69AD
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbgDMQRx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731412AbgDMQRx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:17:53 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01141C0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:17:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id g2so3553371plo.3
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dZodWSADsD4+02W+uu26+GNwxjaMGZ2eoCvWU9+ybRQ=;
        b=R+wl3a7IBhDa16N/zyXoQhOyiRo+axUJdCoy1fTU7XASodjFV0VB36KUDbXKE7NhNf
         cvfqxcR0arixdWwxPCyy/NzwyvyPjry0FVCyTgEnndaPkf1N3EPU4Uv3zsRZ0Vz3M8ra
         RzwZe/XeXEfxCaRtvVcbHJ3PW5x2GkDySKiwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dZodWSADsD4+02W+uu26+GNwxjaMGZ2eoCvWU9+ybRQ=;
        b=KwkbJCqzCU4TkW9Uak3gvd9+dMCbyep9aE1FWFsPVlOBLyyfl0TZrD856aqmGLppJA
         e/PJ3315yAayl/RzXX6yt8iHtn0AjpdDoBmvJfCTzX2TA0VWTHE9JzAA4ltVU5v+Wol/
         tv4niDo+uAJe/cK+Oq5tgW/0+fW86LZtmL6IBswXlpChktFBospEJzqlctckdp5WE0GI
         5+tcU/9HvyAkh+M3qJrJecG2o9rQkDz20sLjOd2ie/tv3dTiSePqFh7qqLNoFjJ/GoWh
         TgLg4vxLPpG9XdjC1b+a2kublog0ssENUj9CMb0+NSRYWmVKhl7kbpbvVNVPjUPtHc05
         DBWw==
X-Gm-Message-State: AGi0Puav91n/YfcIMkLWGRmxbBMCUxXqYdJbYgoVvI06sSY0xr/5OHNh
        Qaj+0GqRYCHlGFXHAjx2EdjGtA==
X-Google-Smtp-Source: APiQypLsFO5YaDx0UfCNqNhFT3hgPVeQlhcrrYvegdBuiP5TOgelY9ej91SoKDRWuuXVwFJOZsQClA==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr16961262plp.96.1586794672507;
        Mon, 13 Apr 2020 09:17:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x7sm6866090pjg.26.2020.04.13.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:17:51 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:17:50 -0700
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: filename_trans_read_one(): Resource leaks
Message-ID: <202004130917.435ED43FDB@keescook>
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

  Tue Feb 18 12:27:34 2020 +0100
    c3a276111ea2 ("selinux: optimize storage of filename transitions")

Coverity reported the following:

*** CID 1461665:  Resource leaks  (RESOURCE_LEAK)
/security/selinux/ss/policydb.c: 1862 in filename_trans_read_one()
1856     		return rc;
1857     	len = le32_to_cpu(buf[0]);
1858
1859     	/* path component string */
1860     	rc = str_read(&name, GFP_KERNEL, fp, len);
1861     	if (rc)
vvv     CID 1461665:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "name" going out of scope leaks the storage it points to.
1862     		return rc;
1863
1864     	rc = next_entry(buf, fp, sizeof(u32) * 4);
1865     	if (rc)
1866     		goto out;
1867

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461665 ("Resource leaks")
Fixes: c3a276111ea2 ("selinux: optimize storage of filename transitions")

Thanks for your attention!

-- 
Coverity-bot
