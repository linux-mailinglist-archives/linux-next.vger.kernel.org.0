Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E863F0005
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 15:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfKEOie (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 09:38:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:52124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfKEOie (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 09:38:34 -0500
Received: from localhost (unknown [193.47.165.251])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13B6A21929;
        Tue,  5 Nov 2019 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572964713;
        bh=KlnLyT80Y+INfsk/NwmS4d5XrPD9eadBhMQpfVA9QyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eRYfKxBwGDA05rqttujdIacDFirkF1NPr+o800mOsO3qkB80orOMYVHkdPidH56YN
         NgF2rn8tHVVHkN5Eux51LU/Eamd3ErDIl/Ep8jxf9NotOzJtQdPD5xpU0or+EwX1OT
         bFyu66scCHwaHgEzVm5oAg42nIbtbtUoYC68y43M=
Date:   Tue, 5 Nov 2019 16:38:30 +0200
From:   Leon Romanovsky <leon@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Parav Pandit <parav@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: linux-next: build warning after merge of the mlx5-next tree
Message-ID: <20191105143830.GE6763@unreal>
References: <20191105130728.0dd89a42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105130728.0dd89a42@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 01:07:28PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mlx5-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/net/ethernet/mellanox/mlx5/core/eswitch.c: In function 'esw_vport_ingress_config':
> drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spec' may be used uninitialized in this function [-Wmaybe-uninitialized]
>  1356 |  kvfree(spec);
>       |  ^~~~~~~~~~~~
>
> Introduced by commit
>
>   10652f39943e ("net/mlx5: Refactor ingress acl configuration")

Thanks Stephen.

>
> --
> Cheers,
> Stephen Rothwell


