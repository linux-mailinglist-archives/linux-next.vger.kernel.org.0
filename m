Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C64258C4E
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 12:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgIAKFx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 06:05:53 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:60654
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbgIAKFx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 06:05:53 -0400
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; 
   d="scan'208";a="357780935"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 12:05:51 +0200
Date:   Tue, 1 Sep 2020 12:05:51 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the v4l-dvb
 tree
In-Reply-To: <20200901190354.38b0d16c@canb.auug.org.au>
Message-ID: <alpine.DEB.2.22.394.2009011205090.2533@hadrien>
References: <20200901190354.38b0d16c@canb.auug.org.au>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On Tue, 1 Sep 2020, Stephen Rothwell wrote:

> Hi all,
>
> Commits
>
>   063a27cb9820 ("media: tm6000: drop unnecessary list_empty")
>   1c047c859965 ("media: saa7134: drop unnecessary list_empty")
>   3fdcea7c763a ("media: cx231xx: drop unnecessary list_empty")
>
> are missing a Signed-off-by from their author.

My record of these patches all have their Signed-off-bys.  Mauro, do you
want me to send them again?

thanks,
julia
