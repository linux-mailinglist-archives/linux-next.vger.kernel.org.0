Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED34E32A994
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243918AbhCBSfC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:35:02 -0500
Received: from ozlabs.org ([203.11.71.1]:48077 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241661AbhCBCJu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Mar 2021 21:09:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DqLCl0gdqz9s1l;
        Tue,  2 Mar 2021 13:09:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1614650947;
        bh=43rR5Zp4k5I4zGrVf/+RiKC5vErMo3wYmtY4bmcRmsA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HpZ+Oh2iNxKicmC1PzodQXqkyHpjRTYDNBRIJMEmpSjqqcp/CRqCahnUFZ4qMV7nu
         CdY9REoh5BBo15+ot1ixnH3s/uIPcX3e1qLi9ZB1bgpIIEILc1JQ/1Boue0nYfV5ET
         IGZC61B8sHEsrSFswrLhjNvDaNeRqCBfhpMtRp7PRFRSqQf3lDlHsagyz73snTg18/
         6N4nYjAspa4DML1rw2Q9xm0xCWN/E/vSbEMPrmWCrBGKdc7l2b8w3+umg83e2ixVGd
         NAszUP8NPrPNzwRGVuZg0+EK/TJEUe8JataAJin7GaInqTqkGF6fQwUl/ZjA19s7ht
         eyYp85nTV0fiA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
In-Reply-To: <20210302112131.5bb7b08b@canb.auug.org.au>
References: <20210302112131.5bb7b08b@canb.auug.org.au>
Date:   Tue, 02 Mar 2021 13:09:03 +1100
Message-ID: <87pn0is3wg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the powerpc-fixes tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types for 'ibmvnic_remove'
>  5399 | static void ibmvnic_remove(struct vio_dev *dev)
>       |             ^~~~~~~~~~~~~~
> drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration of 'ibmvnic_remove' was here
>    81 | static int ibmvnic_remove(struct vio_dev *);
>       |            ^~~~~~~~~~~~~~
>
> Caused by commit
>
>   1bdd1e6f9320 ("vio: make remove callback return void")

Gah, is IBMVNIC in any of our defconfigs?! ... no it's not.

> I have applied the following patch for today:

Thanks, I'll squash it in.

cheers

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Mar 2021 11:06:37 +1100
> Subject: [PATCH] vio: fix for make remove callback return void
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index eb39318766f6..fe3201ba2034 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -78,7 +78,6 @@ MODULE_LICENSE("GPL");
>  MODULE_VERSION(IBMVNIC_DRIVER_VERSION);
>  
>  static int ibmvnic_version = IBMVNIC_INITIAL_VERSION;
> -static int ibmvnic_remove(struct vio_dev *);
>  static void release_sub_crqs(struct ibmvnic_adapter *, bool);
>  static int ibmvnic_reset_crq(struct ibmvnic_adapter *);
>  static int ibmvnic_send_crq_init(struct ibmvnic_adapter *);
> -- 
> 2.30.0
>
> -- 
> Cheers,
> Stephen Rothwell
