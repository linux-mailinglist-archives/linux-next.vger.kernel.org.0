Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2FDE7CB2
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbfJ1XFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:05:52 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:44688 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XFw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:05:52 -0400
Received: by mail-pg1-f181.google.com with SMTP id e10so8022863pgd.11
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uUYyT48EksCyCFgpwQb9nbfkW5tTLS7XeTpEf+hkg90=;
        b=AQ4T+MUjYjMWhZvmiQtFfd6jSMbfL64to4FIIGrl3biZem327UDwODu/9/3lJxScBr
         h3c7aA4F2gvtVN9sUUkGO56Yu+k7KbY3A0axY6sa9fzEBYqgWm2Rqq9+qT0FbDRTo9bO
         YhnMd4la6vpNgGQcr7c7hobDFGVZfOORBYJzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uUYyT48EksCyCFgpwQb9nbfkW5tTLS7XeTpEf+hkg90=;
        b=Cm9bPB9LKbjCiy+FUjnArQzlNQZOqTjQt6gNDy0BgiwkidIlFqlKdeP17gQeXsWcud
         x0zNKLU8FExl4DpwM4VPxmpnjLhoqf7cELSojyssv6XInqSMx3FZVgeySuisEMDYbgo6
         vnW2FF4W1idl0kZlMTuvG38Foy+9Jfo+Vy4AtTw7Tq+uFtXcgPQAtZQLT8MxVt28wKGp
         caPcAmEwUgy03qMJ8+C7PNf8Q+DQXQNapB/8a3nmbdgQ2O6mOcT0/VJZJEM18mbc0Cie
         IQEgJoLzZisINqJG/wpcbgO6FGTviiML2nsX+hXz7dzna72tnrwn9DJuYQsDfB4h/z0H
         6RxQ==
X-Gm-Message-State: APjAAAWzVp7o1NsTXzQvLFffYSLwYiYFmKDVGkYSzQqNDqBmNJTza0t6
        WZkDB64axuy5x5juQbRbJsh4Dw==
X-Google-Smtp-Source: APXvYqxOfvUv1CUw+FO6XvjWAnrgUTyFYkUHaXdtIXkr3U2N5HXxnBo0UEhNi/zJ+8WXz0TVs+hoUA==
X-Received: by 2002:a62:3387:: with SMTP id z129mr22369199pfz.253.1572303950603;
        Mon, 28 Oct 2019 16:05:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e23sm12603391pgh.84.2019.10.28.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:05:49 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:05:49 -0700
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: spi_nor_erase_sector(): Null pointer dereferences
Message-ID: <201910281605.9E90B64E86@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

453977875364 ("mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'")

Coverity reported the following:

*** CID 1487363:  Null pointer dereferences  (FORWARD_NULL)
/drivers/mtd/spi-nor/spi-nor.c: 967 in spi_nor_erase_sector()
961     	 */
962     	for (i = nor->addr_width - 1; i >= 0; i--) {
963     		nor->bouncebuf[i] = addr & 0xff;
964     		addr >>= 8;
965     	}
966
vvv     CID 1487363:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "nor->controller_ops".
967     	return nor->controller_ops->write_reg(nor, nor->erase_opcode,
968     					      nor->bouncebuf, nor->addr_width);
969     }
970
971     /**
972      * spi_nor_div_by_erase_size() - calculate remainder and update new dividend

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487363 ("Null pointer dereferences")
Fixes: 453977875364 ("mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'")


Thanks for your attention!

-- 
Coverity-bot
