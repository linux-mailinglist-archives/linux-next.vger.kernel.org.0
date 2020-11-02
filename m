Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572762A30BD
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 18:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgKBRDS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 12:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgKBRDS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 12:03:18 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE2BC0617A6;
        Mon,  2 Nov 2020 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8R9siPqKWQkaZsoyJP4hgDCdyshjHYVTZKbppBnGdqc=; b=FAzSHDs6kcdBpZZIh++eooksKw
        JVNWWK0TevpgD757i9gABdsindQ0fmCtpQo5XottcABwgUduPrbJxKSB1jB8jBdMSgmrAjjmcZP/W
        pibknGDMZ0EB5qklmGUbijqLs1qdiJiBluQUIpkHCueBTWJXVZPAaG2pqDQlz/vgcKjViduh46tap
        HcqzHO54V61MlXc25/YkDJS1v51/kimxezVLx+AAj/LaK668hQm9LPzz4qfxsFBFzkyKhRWkZaglj
        61CTWeIiIpbolBzVuokLoPjGdtIj0+VMSqBI3QghKU07/98DkgoBJoy5J2jh/eWBQPribDUOpkgvi
        zCZVKCPw==;
Received: from [2601:1c0:6280:3f0::60d5]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kZdEg-0002QW-QC; Mon, 02 Nov 2020 17:03:15 +0000
Subject: Re: linux-next: Tree for Nov 2 [drivers/vdpa/vdpa_sim/vdpa_sim.ko]
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org
References: <20201102162845.3eb6598e@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d3d50a94-cdc5-572b-e9ca-3ee5638d21ee@infradead.org>
Date:   Mon, 2 Nov 2020 09:03:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102162845.3eb6598e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/1/20 9:28 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201030:
> 

on x86_64:

when CONFIG_NET is not enabled:

ERROR: modpost: "mac_pton" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!


Should VDPA_SIM, IFCVF, MLX5_VDPA_NET depend on NET or NETDEVICES?



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
