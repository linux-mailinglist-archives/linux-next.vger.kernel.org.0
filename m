Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDF4443C40
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 05:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhKCEmk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 00:42:40 -0400
Received: from ciao.gmane.io ([116.202.254.214]:44832 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhKCEmj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Nov 2021 00:42:39 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkn-linux-next@m.gmane-mx.org>)
        id 1mi84A-0006Jq-JJ
        for linux-next@vger.kernel.org; Wed, 03 Nov 2021 05:40:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-next@vger.kernel.org
From:   Jean-Denis Girard <jd.girard@sysnux.pf>
Subject: Re: [GIT PULL] zstd changes for linux-next
Date:   Tue, 2 Nov 2021 18:30:20 -1000
Message-ID: <slt39h$k3q$1@ciao.gmane.io>
References: <20211006191724.3187129-1-nickrterrell@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: fr
In-Reply-To: <20211006191724.3187129-1-nickrterrell@gmail.com>
Cc:     linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Le 06/10/2021 à 09:17, Nick Terrell a écrit :
> From: Nick Terrell <terrelln@fb.com>
> 
> The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:
> 
>    Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/terrelln/linux.git zstd-1.4.10
> 
> for you to fetch changes up to a0ccd980d5048053578f3b524e3cd3f5d980a9c5:
> 
>    MAINTAINERS: Add maintainer entry for zstd (2021-10-04 20:04:32 -0700)
> 
> I would like to merge this pull request into linux-next to bake, and then submit
> the PR to Linux in the 5.16 merge window. If you have been a part of the
> discussion, are a maintainer of a caller of zstd, tested this code, or otherwise
> been involved, thank you! And could you please respond below with an appropiate
> tag, so I can collect support for the PR
> 
> Best,
> Nick Terrell


I have used this patch for a while on 5.14.x, and on 5.15 since 
yesterday: no problem found.

Tested-by: Jean-Denis Girard <jd.girard@sysnux.pf>


Thanks,
-- 
Jean-Denis Girard

SysNux                   Systèmes   Linux   en   Polynésie  française
https://www.sysnux.pf/   Tél: +689 40.50.10.40 / GSM: +689 87.797.527

