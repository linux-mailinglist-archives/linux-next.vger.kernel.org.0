Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A583C324AB2
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 08:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhBYHBS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 02:01:18 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:49545 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231843AbhBYHBN (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Feb 2021 02:01:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 71A6AA32;
        Thu, 25 Feb 2021 02:00:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 25 Feb 2021 02:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=RCjZRnDuqK+0Wyl9fuBywH2C8xu
        alnWJuzVOew7w6h4=; b=p2NR3WnxCEnod37exo2ltfhPONrYHD8neNXv01bW4Ad
        tk+1JA2PBAzaRZ0W6FsNtWvaLEdWH0NVshDhQ5VRRlu7rhJXJ5OwbNr4SIdY+qmh
        wWXNQXSa8F5VNctqceXOE0eQngGpSTR/MSDZ83S/hQZTz+E/JKPhh5XxqvxJSYaA
        zE83bEs15JgVrSd3w8NKQLt1hkEF6567nybcoJ41zsteZUdJVfNOVp6EbTURbhIS
        A21fmwx7RZ8hqtP2/HJJETYYmvWLIBIvTbmy3FGUqvcGPbINJ94QqBQJSA8/hKwr
        we7eVRoWFuHFpX6TQIPc260TskCLMpLbJBdgDbngHIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RCjZRn
        DuqK+0Wyl9fuBywH2C8xualnWJuzVOew7w6h4=; b=Bk84yQ8xPuWC8IpFsESREe
        GweS4e+Dk3jf5ZqCFJzqwU9nRJBerdskW9w7gvd7wjYw9nm3DScAWZu7UCnXuaZY
        iZI5MJHPEpWWEvozerb3nuJB/bmnxnDIVzsWD5dG3nqFkjVP794NCKtERDQc02TQ
        GhhnOQmLXREa6xdveR4yDMjDwcEekMWLy2nV3eRfRxI2w4wSSCtYkdYjL2aNEItt
        8MQtCs+I6a3K2ytZfGOUER+6+AaXPFrvaoQ6+MJKrke7o8Zv+o9W0kmXJSwRmpkr
        TdAgNchLJa8piIgYn+qjtX6DSzhvOD3JctGGwqb7vX4p6xwQ/+8vx8x6cJZ5QBKA
        ==
X-ME-Sender: <xms:BUs3YMr5a9WseWaV424Rder1J_3SsExECYpNNCNvjQ-OOWTkprvJSg>
    <xme:BUs3YCrzkpsaT9j0VO44o_OCbZh8ri8ilez4yAWUEpg8Xyu9GGH5UqpN35VkHpC9o
    LXLJ0MbtgD66Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevhefgje
    eitdfffefhvdegleeigeejgeeiffekieffjeeflefhieegtefhudejueenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:BUs3YBOdIdJmhMcWlv8IsCPUSWb4RvROkiX2-awlbiZA7NjwLXQ7Wg>
    <xmx:BUs3YD5f1jdbZmXZ4ZLh4UCXzx91it8cVuy3XxIApTQOoN_tXKoXZg>
    <xmx:BUs3YL4FRC2MHUNIXvhjhDSb64_EkXHQC6Kc8sSPirT9ItUrZ9e87Q>
    <xmx:B0s3YIHLWV-0b9NkmyRUGJ2VKAthBdXsnxVYcKvq3Axi2_eODORYIruGsW8>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 101BF108006E;
        Thu, 25 Feb 2021 02:00:20 -0500 (EST)
Date:   Thu, 25 Feb 2021 08:00:16 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Moritz Fischer <mdf@kernel.org>,
        Russ Weight <russell.h.weight@intel.com>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drivers-x86 tree
Message-ID: <YDdLADSYwApJXirP@kroah.com>
References: <20210111130851.374bf4ea@canb.auug.org.au>
 <20210215074431.7a06b223@canb.auug.org.au>
 <20210223142833.377289f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223142833.377289f6@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 23, 2021 at 02:28:33PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 15 Feb 2021 07:44:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 11 Jan 2021 13:08:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the char-misc tree got conflicts in:
> > > 
> > >   include/linux/mod_devicetable.h
> > >   scripts/mod/devicetable-offsets.c
> > >   scripts/mod/file2alias.c
> > > 
> > > between commit:
> > > 
> > >   eb0e90a82098 ("platform/surface: aggregator: Add dedicated bus and device type")
> > > 
> > > from the drivers-x86 tree and commits:
> > > 
> > >   9326eecd9365 ("fpga: dfl: move dfl_device_id to mod_devicetable.h")
> > >   4a224acec597 ("fpga: dfl: add dfl bus support to MODULE_DEVICE_TABLE()")
> > > 
> > > from the char-misc tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > diff --cc include/linux/mod_devicetable.h
> > > index 935060955152,b8dae34eca10..000000000000
> > > --- a/include/linux/mod_devicetable.h
> > > +++ b/include/linux/mod_devicetable.h
> > > @@@ -846,22 -846,28 +846,46 @@@ struct auxiliary_device_id 
> > >   	kernel_ulong_t driver_data;
> > >   };
> > >   
> > >  +/* Surface System Aggregator Module */
> > >  +
> > >  +#define SSAM_MATCH_TARGET	0x1
> > >  +#define SSAM_MATCH_INSTANCE	0x2
> > >  +#define SSAM_MATCH_FUNCTION	0x4
> > >  +
> > >  +struct ssam_device_id {
> > >  +	__u8 match_flags;
> > >  +
> > >  +	__u8 domain;
> > >  +	__u8 category;
> > >  +	__u8 target;
> > >  +	__u8 instance;
> > >  +	__u8 function;
> > >  +
> > >  +	kernel_ulong_t driver_data;
> > >  +};
> > >  +
> > > + /*
> > > +  * DFL (Device Feature List)
> > > +  *
> > > +  * DFL defines a linked list of feature headers within the device MMIO space to
> > > +  * provide an extensible way of adding features. Software can walk through these
> > > +  * predefined data structures to enumerate features. It is now used in the FPGA.
> > > +  * See Documentation/fpga/dfl.rst for more information.
> > > +  *
> > > +  * The dfl bus type is introduced to match the individual feature devices (dfl
> > > +  * devices) for specific dfl drivers.
> > > +  */
> > > + 
> > > + /**
> > > +  * struct dfl_device_id -  dfl device identifier
> > > +  * @type: DFL FIU type of the device. See enum dfl_id_type.
> > > +  * @feature_id: feature identifier local to its DFL FIU type.
> > > +  * @driver_data: driver specific data.
> > > +  */
> > > + struct dfl_device_id {
> > > + 	__u16 type;
> > > + 	__u16 feature_id;
> > > + 	kernel_ulong_t driver_data;
> > > + };
> > > + 
> > >   #endif /* LINUX_MOD_DEVICETABLE_H */
> > > diff --cc scripts/mod/devicetable-offsets.c
> > > index f078eeb0a961,1b14f3cde4e5..000000000000
> > > --- a/scripts/mod/devicetable-offsets.c
> > > +++ b/scripts/mod/devicetable-offsets.c
> > > @@@ -246,13 -246,9 +246,17 @@@ int main(void
> > >   	DEVID(auxiliary_device_id);
> > >   	DEVID_FIELD(auxiliary_device_id, name);
> > >   
> > >  +	DEVID(ssam_device_id);
> > >  +	DEVID_FIELD(ssam_device_id, match_flags);
> > >  +	DEVID_FIELD(ssam_device_id, domain);
> > >  +	DEVID_FIELD(ssam_device_id, category);
> > >  +	DEVID_FIELD(ssam_device_id, target);
> > >  +	DEVID_FIELD(ssam_device_id, instance);
> > >  +	DEVID_FIELD(ssam_device_id, function);
> > >  +
> > > + 	DEVID(dfl_device_id);
> > > + 	DEVID_FIELD(dfl_device_id, type);
> > > + 	DEVID_FIELD(dfl_device_id, feature_id);
> > > + 
> > >   	return 0;
> > >   }
> > > diff --cc scripts/mod/file2alias.c
> > > index d21d2871387b,7ebabeb1e9c9..000000000000
> > > --- a/scripts/mod/file2alias.c
> > > +++ b/scripts/mod/file2alias.c
> > > @@@ -1375,28 -1375,18 +1375,40 @@@ static int do_auxiliary_entry(const cha
> > >   	return 1;
> > >   }
> > >   
> > >  +/*
> > >  + * Looks like: ssam:dNcNtNiNfN
> > >  + *
> > >  + * N is exactly 2 digits, where each is an upper-case hex digit.
> > >  + */
> > >  +static int do_ssam_entry(const char *filename, void *symval, char *alias)
> > >  +{
> > >  +	DEF_FIELD(symval, ssam_device_id, match_flags);
> > >  +	DEF_FIELD(symval, ssam_device_id, domain);
> > >  +	DEF_FIELD(symval, ssam_device_id, category);
> > >  +	DEF_FIELD(symval, ssam_device_id, target);
> > >  +	DEF_FIELD(symval, ssam_device_id, instance);
> > >  +	DEF_FIELD(symval, ssam_device_id, function);
> > >  +
> > >  +	sprintf(alias, "ssam:d%02Xc%02X", domain, category);
> > >  +	ADD(alias, "t", match_flags & SSAM_MATCH_TARGET, target);
> > >  +	ADD(alias, "i", match_flags & SSAM_MATCH_INSTANCE, instance);
> > >  +	ADD(alias, "f", match_flags & SSAM_MATCH_FUNCTION, function);
> > >  +
> > >  +	return 1;
> > >  +}
> > >  +
> > > + /* Looks like: dfl:tNfN */
> > > + static int do_dfl_entry(const char *filename, void *symval, char *alias)
> > > + {
> > > + 	DEF_FIELD(symval, dfl_device_id, type);
> > > + 	DEF_FIELD(symval, dfl_device_id, feature_id);
> > > + 
> > > + 	sprintf(alias, "dfl:t%04Xf%04X", type, feature_id);
> > > + 
> > > + 	add_wildcard(alias);
> > > + 	return 1;
> > > + }
> > > + 
> > >   /* Does namelen bytes of name exactly match the symbol? */
> > >   static bool sym_is(const char *name, unsigned namelen, const char *symbol)
> > >   {
> > > @@@ -1472,7 -1462,7 +1484,8 @@@ static const struct devtable devtable[
> > >   	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
> > >   	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
> > >   	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
> > >  +	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
> > > + 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
> > >   };
> > >   
> > >   /* Create MODULE_ALIAS() statements.  
> > 
> > With the merge window about to open, this is a reminder that this
> > conflict still exists.
> 
> This is now a conflict between the char-misc tree and Linus' tree.

Linus resolved this now.

thnaks,

greg k-h
