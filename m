Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09631802FF
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 17:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgCJQRf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 12:17:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726622AbgCJQRf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 12:17:35 -0400
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 881E120873;
        Tue, 10 Mar 2020 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583857054;
        bh=70lmf/pY6vEwONvZ6PZih0Yp55cwrHsfTfIw1de/jRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xGAB5b41tvvod8eyx64BQ/BmGn53A6Li05O2X/iNXXKLxox9VViNvxX8uJM+bk5eq
         zU/wOfUTs5qxtrGkE3U9kxXzNIyic+QxkxCOyYN5rI8Vdv+t6Mu9GAMca9NES9X/kA
         LxL/XPwMuEcJIjXGsZVlTcvW6Dj02VeDkxTWOTJo=
Date:   Tue, 10 Mar 2020 09:17:34 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the f2fs tree
Message-ID: <20200310161734.GA240315@google.com>
References: <20200310205809.415bd0a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310205809.415bd0a2@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/10, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   11150f0f3096 ("f2fs: fix reboot timeout crash observed with Andorid R")
> 
> is missing a Signed-off-by from its committer.

Fixed. Thanks.

> 
> -- 
> Cheers,
> Stephen Rothwell


