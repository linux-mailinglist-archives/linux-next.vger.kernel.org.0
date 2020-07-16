Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B7222147
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 13:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgGPLVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 07:21:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:59898 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgGPLVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 07:21:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5A7A0AC52;
        Thu, 16 Jul 2020 11:21:39 +0000 (UTC)
Date:   Thu, 16 Jul 2020 13:21:34 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: failing to fetch the dmi tree
Message-ID: <20200716132134.56cb4bc1@endymion>
In-Reply-To: <20200715113743.6d54eefa@endymion>
References: <20200713091102.28d186ca@canb.auug.org.au>
        <20200715113743.6d54eefa@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, 15 Jul 2020 11:37:43 +0200, Jean Delvare wrote:
> On Mon, 13 Jul 2020 09:11:02 +1000, Stephen Rothwell wrote:
> > Jean, I don't suppose you would like to produce a git tree for me to
> > fetch instead, as yours is the last quilt series I fetch (apart from
> > Andrew's which is special).  
> 
> Actually, feel free to suppose. While a quilt tree fits my current
> workflow better, I don't want to be the guy who makes your life more
> difficult. Let me give it a try.

OK, so my old for-next branch in quilt format is still at:

http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/

and what should be a git equivalent of it is at:

git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git dmi-for-next

If the latter works for you then I shall be ready to switch to it
officially. If there's anything wrong, please let me know.

Will you curse me if I ever rebase this branch?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
