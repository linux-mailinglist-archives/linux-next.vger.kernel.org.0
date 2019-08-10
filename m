Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF8088B27
	for <lists+linux-next@lfdr.de>; Sat, 10 Aug 2019 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfHJLzg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Aug 2019 07:55:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbfHJLzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 10 Aug 2019 07:55:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF76120880;
        Sat, 10 Aug 2019 11:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565438135;
        bh=RZI/Tb9YvCMrcP9KfiEOl4Eo4vpguBqD0XIW4QHFUH8=;
        h=Date:From:To:Cc:Subject:From;
        b=h8xzisPV0nm5yRzzttW9CjpxrXHfVvGt+XzoN4R6ofpCdPZ7Y/DCysNqD6XGuFH2u
         Fpv9K5RQxeKuBQo4YJrgF4RcE8vcdVk4lBW/tgxGF+L1WU80Y5tx1IdZXWZbCwuJ/2
         Fhf26inJVTcFozedAArsQJWyvQchqhWXUO3wDp2o=
Date:   Sat, 10 Aug 2019 13:55:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Add SPDX kernel tree to linux-next
Message-ID: <20190810115533.GA6302@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

I realized that I've been sending patches to Linus from my "SPDX" kernel
tree for a few releases now, and it's not included in linux-next, which
is not good.

So, could you please add the kernel tree / branch at:
	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git spdx-linus

to linux-next?

thanks,

greg k-h
