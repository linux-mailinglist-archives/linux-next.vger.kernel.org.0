Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674C0E55F0
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 23:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfJYVds (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 17:33:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45960 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726300AbfJYVdq (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Oct 2019 17:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572039225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V+bF0QtZ1XTU+DOJV+lanoshTKDpNiumcmQH+i3m6S0=;
        b=hrasXp4G4AOZBEXJOlFz/Ztn/4YjTTfNGW83/juxhU1XVgiZ8DHg5HZIwXW6ZIPpsCphGb
        dITZWAawb/KJlUiv/ftJMsrDnm0eI1eu5H5+6XB+JMemitb8bAEaaAYlmiez3dozVoFErI
        6637Ti7/gK5khjJfDd0vUhqO7e7z2SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-WvtHTBd2Nn2Fgt22bTNHcw-1; Fri, 25 Oct 2019 17:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B3A147B;
        Fri, 25 Oct 2019 21:33:40 +0000 (UTC)
Received: from emilne (unknown [10.18.25.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 55D9764020;
        Fri, 25 Oct 2019 21:33:39 +0000 (UTC)
Message-ID: <557baf9f96bf15982dea0ad063412834bfbdccaa.camel@redhat.com>
Subject: Re: [PATCH] lpfc: fix build error of lpfc_debugfs.c for
 vfree/vmalloc
From:   "Ewan D. Milne" <emilne@redhat.com>
To:     James Smart <jsmart2021@gmail.com>, linux-scsi@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        martin.petersen@oracle.com, sfr@canb.auug.org.au,
        Dick Kennedy <dick.kennedy@broadcom.com>
Date:   Fri, 25 Oct 2019 17:33:38 -0400
In-Reply-To: <20191025182530.26653-1-jsmart2021@gmail.com>
References: <20191025182530.26653-1-jsmart2021@gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: WvtHTBd2Nn2Fgt22bTNHcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2019-10-25 at 11:25 -0700, James Smart wrote:
> lpfc_debufs.c was missing include of vmalloc.h when compiled on PPC.
>=20
> Add missing header.
>=20
> Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
> Signed-off-by: James Smart <jsmart2021@gmail.com>
> ---
>  drivers/scsi/lpfc/lpfc_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_de=
bugfs.c
> index ab124f7d50d6..6c8effcfc8ae 100644
> --- a/drivers/scsi/lpfc/lpfc_debugfs.c
> +++ b/drivers/scsi/lpfc/lpfc_debugfs.c
> @@ -31,6 +31,7 @@
>  #include <linux/pci.h>
>  #include <linux/spinlock.h>
>  #include <linux/ctype.h>
> +#include <linux/vmalloc.h>
> =20
>  #include <scsi/scsi.h>
>  #include <scsi/scsi_device.h>

Reviewed-by: Ewan D. Milne <emilne@redhat.com>

