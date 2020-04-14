Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3551A82CB
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 17:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407440AbgDNPdP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 11:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407370AbgDNPdL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 11:33:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55951C061A0C
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 08:33:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id g2so64617plo.3
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2PeDvZZPLzrSe4MUKokc0ABsoLC2STEgaQRfwvj/AIU=;
        b=dKSd4WKnVf/Kdd03aq1BueDtS7bfnCUqc3Bh8aIARAN18PZrr5VkbVgNdg2en8IE3L
         5kuUK1bJuqjWnMoQtbLCu4G8482Cww2QHbanTuuVrwALYLUDn2CLOxwqQQNe8ybA28mb
         V+/xPz7T9jQN6LkbA1Ws6LrQG4983smNdsD7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2PeDvZZPLzrSe4MUKokc0ABsoLC2STEgaQRfwvj/AIU=;
        b=aBmIdlfbGticGrE38xDTCPqomVaJevPQoIn7AswJBDq2n71dhXB3PbCJm/LcfIJhAr
         zc8qOlMaYPJRMVKgBImqbUVrzDOpoe06ma716mf6eVBLJWInWw9PAVP1V5r91NaCm6ck
         fhDQhOHO7sFeX/x9HEPE9zW8Mm0p0rKvzEqWW5lbuwd5ubSStdveIivpj6jRVoijEbyX
         5ppfV/tP7SND0ZminkJVv813ZfMRteHd+tEpk1/5tGrfufJPnS7S5fNM3xkyF57RPziN
         V8RHl2z7vOJpweuViNcP7G8xvI9m/kSkYBsvx+QUy7grxrehgXjJ14WkNPZWshSoZk1H
         QPIg==
X-Gm-Message-State: AGi0PuaH9BQXPkswHQ6KtSS8OPJtYUHke7D6TpyBSVeuaa565QMQaOYH
        lMa9fDLiZ+GcjhvpTI6CIqwtPTaz/Us=
X-Google-Smtp-Source: APiQypIU9yUX1FJy6PUzjsEAMpBc+fuSwhoIccwNso4l0IYxk9Ozmbsw9rHU3WAh/Yeg5ROKA0j/zA==
X-Received: by 2002:a17:902:7689:: with SMTP id m9mr442247pll.187.1586878389879;
        Tue, 14 Apr 2020 08:33:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p62sm3954714pfb.93.2020.04.14.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:33:09 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 14 Apr 2020 08:33:08 -0700
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: mmal_setup_video_component(): Code maintainability issues
Message-ID: <202004140833.632892C8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200414 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sun Mar 29 14:44:58 2020 +0200
    1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")

Coverity reported the following:

*** CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c: 1014 in mmal_setup_video_component()
1008     	if (overlay_enabled) {
1009     		/* Need to disable the overlay before we can update
1010     		 * the resolution
1011     		 */
1012     		ret = vchiq_mmal_port_disable(dev->instance, preview_port);
1013     		if (!ret) {
vvv     CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
vvv     Assigning value from "vchiq_mmal_port_connect_tunnel(dev->instance, preview_port, NULL)" to "ret" here, but that stored value is overwritten before it can be used.
1014     			ret = vchiq_mmal_port_connect_tunnel(dev->instance,
1015     							     preview_port,
1016     							     NULL);
1017     		}
1018     	}
1019     	preview_port->es.video.width = f->fmt.pix.width;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492591 ("Code maintainability issues")
Fixes: 1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")

Thanks for your attention!

-- 
Coverity-bot
