Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954EA11D906
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 23:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbfLLWEv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 17:04:51 -0500
Received: from linux.microsoft.com ([13.77.154.182]:50040 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730779AbfLLWEu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Dec 2019 17:04:50 -0500
Received: by linux.microsoft.com (Postfix, from userid 1001)
        id DE80920B7187; Thu, 12 Dec 2019 14:04:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE80920B7187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
        s=default; t=1576188289;
        bh=jkm72bW0CrlIB8ikaKjBSdd8IXwgeJj35zWeOybEfsc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JaiU05aLioDaWOBB2diCOCBUvavRkymjLyLOPgH+/O67bH2oVDs2wTOCF82t1RU55
         kzfqm/HXl/Xp/5ANfJ31B6RsCVXz1C0h+xhHIpUs8HMT78pr8AMoW6VsV/GxgI1sYY
         HG/E4wRPS4Bc6x9f9HRp5RWQoZcO0yTZVL3cssNU=
Received: from localhost (localhost [127.0.0.1])
        by linux.microsoft.com (Postfix) with ESMTP id DBC003070327;
        Thu, 12 Dec 2019 14:04:49 -0800 (PST)
Date:   Thu, 12 Dec 2019 14:04:49 -0800 (PST)
From:   James Morris <jamorris@linuxonhyperv.com>
X-X-Sender: jamorris@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To:     Paul Moore <paul@paul-moore.com>
cc:     Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-next@vger.kernel.org,
        jamorris@linux.microsoft.com
Subject: Re: [PATCH] security: only build lsm_audit if CONFIG_SECURITY=y
In-Reply-To: <CAHC9VhRnqfuVUTDZA+8G-_OTqqN8M7XJhOpiO1m3t0XhY584Xw@mail.gmail.com>
Message-ID: <alpine.LRH.2.21.1912121404420.96286@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20191210165541.85245-1-sds@tycho.nsa.gov> <CAHC9VhRnqfuVUTDZA+8G-_OTqqN8M7XJhOpiO1m3t0XhY584Xw@mail.gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 10 Dec 2019, Paul Moore wrote:

> On Tue, Dec 10, 2019 at 11:55 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> > The lsm_audit code is only required when CONFIG_SECURITY is enabled.
> > It does not have a build dependency on CONFIG_AUDIT since audit.h
> > provides trivial static inlines for audit_log*() when CONFIG_AUDIT
> > is disabled.  Hence, the Makefile should only add lsm_audit to the
> > obj lists based on CONFIG_SECURITY, not CONFIG_AUDIT.
> >
> > Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> > Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> > ---
> >  security/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Merged into selinux/next in order to fix the linux-next build
> breakage.  James, if you would prefer a different fix, let us know.

LGTM

> 
> > diff --git a/security/Makefile b/security/Makefile
> > index be1dd9d2cb2f..746438499029 100644
> > --- a/security/Makefile
> > +++ b/security/Makefile
> > @@ -22,7 +22,7 @@ obj-$(CONFIG_SECURITY)                        += security.o
> >  obj-$(CONFIG_SECURITYFS)               += inode.o
> >  obj-$(CONFIG_SECURITY_SELINUX)         += selinux/
> >  obj-$(CONFIG_SECURITY_SMACK)           += smack/
> > -obj-$(CONFIG_AUDIT)                    += lsm_audit.o
> > +obj-$(CONFIG_SECURITY)                 += lsm_audit.o
> >  obj-$(CONFIG_SECURITY_TOMOYO)          += tomoyo/
> >  obj-$(CONFIG_SECURITY_APPARMOR)                += apparmor/
> >  obj-$(CONFIG_SECURITY_YAMA)            += yama/
> > --
> > 2.23.0
> 
> -- 
> paul moore
> www.paul-moore.com
> 


-- 
James Morris
<jamorris@linuxonhyperv.com>
