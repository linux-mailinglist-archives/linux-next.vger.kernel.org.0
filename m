Return-Path: <linux-next+bounces-9138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D967C77E49
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 09:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB62935F797
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 08:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC6D221F03;
	Fri, 21 Nov 2025 08:22:28 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACA33B6DF
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713348; cv=none; b=RTHHLCfLmGzHYl8zZ3x3/OqBlNLwNvXb7sdO213Y6UoO5Cb2Sd2oO2i9h0KZJZmhenbu33WKDJgxxSJ/ZpAmzzjFIVCm7a/hcpoAmqaOEVvoOKxQ2J19sQKMnGbSsXG3Z1UM3GDFekhbrBlzKXPDh3xV8MPOI4AiGZxjN3PRwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713348; c=relaxed/simple;
	bh=kXsoTxJXHIA15uWZSE9k9k9aAVQNaqibKCvhkYz6FyA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIaSME+c6d38crur0wTYkFSdQDLn4Zx8pi6z/QEhidrM4ZRVkTt81ewfuS1X3wfoo0c/1NdGJZl3jqEzd1OA6OShZ2NrL35o2NwFa31NY+EQKQaGbEPwmJt93S5MhGRIZyArZEw+c99o5fXOXmRJqPwZkmChEjvnvmwOSF5SLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMMPG-000505-LQ; Fri, 21 Nov 2025 09:22:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMMPF-001YQN-1n;
	Fri, 21 Nov 2025 09:22:13 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMMPF-000000001ov-24vX;
	Fri, 21 Nov 2025 09:22:13 +0100
Message-ID: <64a9b0f21ec290cb9af5887e8ae46b90ce34edc2.camel@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the reset tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bartosz Golaszewski
	 <bartosz.golaszewski@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Fri, 21 Nov 2025 09:22:13 +0100
In-Reply-To: <20251121145042.3cef6e7a@canb.auug.org.au>
References: <20251121111534.7cdbfe5c@canb.auug.org.au>
	 <20251121145042.3cef6e7a@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org

On Fr, 2025-11-21 at 14:50 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> On Fri, 21 Nov 2025 11:15:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > After merging the reset tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/platform/x86/intel/chtwc_int33fe.c:80:12: error: 'struct softwa=
re_node_ref_args' has no member named 'node'; did you mean 'swnode'?
> >    80 |         { .node =3D NULL },
> >       |            ^~~~
> >       |            swnode
> > drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_re=
move_nodes':
> > drivers/platform/x86/intel/chtwc_int33fe.c:193:33: error: 'struct softw=
are_node_ref_args' has no member named 'node'; did you mean 'swnode'?
> >   193 |         if (fusb302_mux_refs[0].node) {
> >       |                                 ^~~~
> >       |                                 swnode
> > drivers/platform/x86/intel/chtwc_int33fe.c:194:76: error: 'struct softw=
are_node_ref_args' has no member named 'node'; did you mean 'swnode'?
> >   194 |                 fwnode_handle_put(software_node_fwnode(fusb302_=
mux_refs[0].node));
> >       |                                                                =
            ^~~~
> >       |                                                                =
            swnode
> > drivers/platform/x86/intel/chtwc_int33fe.c:195:37: error: 'struct softw=
are_node_ref_args' has no member named 'node'; did you mean 'swnode'?
> >   195 |                 fusb302_mux_refs[0].node =3D NULL;
> >       |                                     ^~~~
> >       |                                     swnode
> > drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_ad=
d_nodes':
> > drivers/platform/x86/intel/chtwc_int33fe.c:225:29: error: 'struct softw=
are_node_ref_args' has no member named 'node'; did you mean 'swnode'?
> >   225 |         fusb302_mux_refs[0].node =3D mux_ref_node;
> >       |                             ^~~~
> >       |                             swnode
> >=20
> > Caused by commit
> >=20
> >   d7cdbbc93c56 ("software node: allow referencing firmware nodes")
> >=20
> > I have used the reset tree from next-20251120 for today.
>=20
> This same commit is also in the gpio-brgl tree, so I have used that
> tree from next-20251120 as well.

Commit d7cdbbc93c56 ("software node: allow referencing firmware nodes")
renames the 'node' field in software_node_ref_args to 'swnode', so the
trivial build fix would be:

----------8<----------
diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/=
x86/intel/chtwc_int33fe.c
index 29e8b5432f4c..96400dec0baf 100644
--- a/drivers/platform/x86/intel/chtwc_int33fe.c
+++ b/drivers/platform/x86/intel/chtwc_int33fe.c
@@ -77,7 +77,7 @@ static const struct software_node max17047_node =3D {
  * software node.
  */
 static struct software_node_ref_args fusb302_mux_refs[] =3D {
-       { .node =3D NULL },
+       { .swnode =3D NULL },
 };
=20
 static const struct property_entry fusb302_properties[] =3D {
@@ -190,9 +190,9 @@ static void cht_int33fe_remove_nodes(struct cht_int33fe=
_data *data)
 {
        software_node_unregister_node_group(node_group);
=20
-       if (fusb302_mux_refs[0].node) {
-               fwnode_handle_put(software_node_fwnode(fusb302_mux_refs[0].=
node));
-               fusb302_mux_refs[0].node =3D NULL;
+       if (fusb302_mux_refs[0].swnode) {
+               fwnode_handle_put(software_node_fwnode(fusb302_mux_refs[0].=
swnode));
+               fusb302_mux_refs[0].swnode =3D NULL;
        }
=20
        if (data->dp) {
@@ -222,7 +222,7 @@ static int cht_int33fe_add_nodes(struct cht_int33fe_dat=
a *data)
         * rely on software_node_register_node_group() to use the original
         * instance of properties instead of copying them.
         */
-       fusb302_mux_refs[0].node =3D mux_ref_node;
+       fusb302_mux_refs[0].swnode =3D mux_ref_node;
=20
        ret =3D software_node_register_node_group(node_group);
        if (ret)

---------->8----------

I assume it was expected that drivers don't modify contents of struct
software_node_ref_args directly, but rather assign them with
SOFTWARE_NODE_REFERENCE(), so maybe this is not the correct fix?

regards
Philipp

