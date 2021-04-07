Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2119356A49
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351561AbhDGKs1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 06:48:27 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:45684 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1351514AbhDGKr5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Apr 2021 06:47:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id C1F6E412F9;
        Wed,  7 Apr 2021 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        in-reply-to:content-disposition:content-type:content-type
        :mime-version:references:message-id:subject:subject:from:from
        :date:date:received:received:received; s=mta-01; t=1617792462;
         x=1619606863; bh=7roLYt9u/nFm7/UOZ37/Olsn4bZK9xpN3jU+NcjGmeQ=; b=
        utXguzKjQ/yKRnRMYOe0FqxDJ/4TiOxOROhLK69ULGqJN3lHzYbfu2PxbWrUC/wp
        pvwMwgExxxFmtDSof8LH8l9RZq1bN+0AnnhVjd+xpuC0NwE+cqRE5IkUvcy0fqYD
        GMzZYsIZ496zy0DjZA7DKmX3DJvZXYHCLwhzPKF1JpI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xSrHqna7VsGI; Wed,  7 Apr 2021 13:47:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com [172.17.100.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 287F74138E;
        Wed,  7 Apr 2021 13:47:40 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 7 Apr
 2021 13:47:40 +0300
Date:   Wed, 7 Apr 2021 13:47:38 +0300
From:   Roman Bolshakov <r.bolshakov@yadro.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Christie <michael.christie@oracle.com>
Subject: Re: linux-next: manual merge of the scsi tree with the scsi-fixes
 tree
Message-ID: <YG2Nype3/WTD/S0q@SPB-NB-133.local>
References: <20210407170457.77b88f83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210407170457.77b88f83@canb.auug.org.au>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 07, 2021 at 05:04:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   drivers/target/iscsi/iscsi_target.c
> 
> between commit:
> 
>   0352c3d3959a ("scsi: target: iscsi: Fix zero tag inside a trace event")
> 
> from the scsi-fixes tree and commit:
> 
>   08694199477d ("scsi: target: core: Add gfp_t arg to target_cmd_init_cdb()")
> 
> from the scsi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Hi Stephen,

I'm sorry for not mentioning the issue. IIRC I sent 0352c3d3959a off
linus/master, because 5.12/scsi-fixes was quite behind it. I have to say
that for this particular fix I didn't try to apply it to 5.13/scsi-queue
because I didn't expect any conflicts for such a small change :)

I will apply to both <next>/scsi-queue and <current>/scsi-fixes next
time before submission even for trivial patches to avoid the confusion.

The conflict resolution is fine.

Thanks,
Roman

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/target/iscsi/iscsi_target.c
> index e5c443bfbdf9,cf7f0465dd63..000000000000
> --- a/drivers/target/iscsi/iscsi_target.c
> +++ b/drivers/target/iscsi/iscsi_target.c
> @@@ -1166,8 -1166,8 +1166,9 @@@ int iscsit_setup_scsi_cmd(struct iscsi_
>   
>   	target_get_sess_cmd(&cmd->se_cmd, true);
>   
>  +	cmd->se_cmd.tag = (__force u32)cmd->init_task_tag;
> - 	cmd->sense_reason = target_cmd_init_cdb(&cmd->se_cmd, hdr->cdb);
> + 	cmd->sense_reason = target_cmd_init_cdb(&cmd->se_cmd, hdr->cdb,
> + 						GFP_KERNEL);
>   	if (cmd->sense_reason) {
>   		if (cmd->sense_reason == TCM_OUT_OF_RESOURCES) {
>   			return iscsit_add_reject_cmd(cmd,


